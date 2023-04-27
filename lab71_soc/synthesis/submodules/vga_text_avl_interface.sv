/************************************************************************
Avalon-MM Interface VGA Text mode display

Register Map:
0x000-0x0257 : VRAM, 80x30 (2400 byte, 600 word) raster order (first column then row)
0x258        : control register

VRAM Format:
X->
[ 31  30-24][ 23  22-16][ 15  14-8 ][ 7    6-0 ]
[IV3][CODE3][IV2][CODE2][IV1][CODE1][IV0][CODE0]

IVn = Draw inverse glyph
CODEn = Glyph code from IBM codepage 437

Control Register Format:
[[31-25][24-21][20-17][16-13][ 12-9][ 8-5 ][ 4-1 ][   0    ] 
[[RSVD ][FGD_R][FGD_G][FGD_B][BKG_R][BKG_G][BKG_B][RESERVED]

VSYNC signal = bit which flips on every Vsync (time for new frame), used to synchronize software
BKG_R/G/B = Background color, flipped with foreground when IVn bit is set
FGD_R/G/B = Foreground color, flipped with background when Inv bit is set

************************************************************************/
`define NUM_REGS 601 //80*30 characters / 4 characters per register
`define CTRL_REG 600 //index of control register

module vga_text_avl_interface (
	// Avalon Clock Input, note this clock is also used for VGA, so this must be 50Mhz
	// We can put a clock divider here in the future to make this IP more generalizable
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,					// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,			// Avalon-MM Byte Enable
	input  logic [11:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,		// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,		// Avalon-MM Read Data
	
	// Exported Conduit (mapped to VGA port - make sure you export in Platform Designer)
	output logic [3:0]  red, green, blue,	// VGA color channels (mapped to output pins in top-level)
	output logic hs, vs						// VGA HS/VS
);

logic [31:0] LOCAL_REG       [`NUM_REGS]; // Registers
//put other local variables here
//enum logic [2:0] {State,Next_State,Ready};
logic pix_clk,blank,sync;
integer i;
logic[31:0] memory_output, memory_output_a; 
//Declare submodules..e.g. VGA controller, ROMS, etc
vga_controller v(.Clk(CLK), 
					   .Reset(RESET),     // reset signal
                  .hs(hs),        // Horizontal sync pulse.  Active low
					   .vs(vs),        // Vertical sync pulse.  Active low
						.pixel_clk(pix_clk), // 25 MHz pixel clock output
						.blank(blank),     // Blanking interval indicator.  Active low.
						.sync(sync),      // Composite Sync signal.  Active low.  We don't use it in this lab,
					   .DrawX(drawX),     // horizontal coordinate
						.DrawY(drawY) 
                  );
						
font_rom f0( .addr(fontrow),
			  .data(data)
				);
ram ram0(.address_a(AVL_ADDR),  
			.rden_a(AVL_CS&&AVL_READ),
			.wren_a(AVL_CS&&AVL_WRITE) , 
			.byteena_a(AVL_BYTE_EN),
			.data_a(AVL_WRITEDATA),
			.q_a(memory_output_a),
			.address_b(vram),
			.rden_b(1'b1),
			.wren_b(1'b0),
			.data_b(),
			.q_b(memory_output),
			.clock(CLK));

//handle drawing (may either be combinational or sequential - or both).
logic [11:0] currChar;
logic [9:0]	drawX,drawY;
logic [3:0] back_R,back_G,back_B, front_R,front_G,front_B;
logic [11:0] vram;
logic [1:0] char;
logic B;
logic [7:0]	data;
logic [10:0] fontrow;
logic [7:0] CHAR;
logic [3:0] FG_IDX, BG_IDX,temp;
logic Inv;
logic[31:0] pallette [8];

//Address 2400
assign currChar=drawX[9:3]+(drawY[9:4]*80);
//Convert to 1200 words for VRAM access
assign vram=currChar[11:1];
//Getting the character from the words
assign char=currChar[0];

assign B=data[7-drawX[2:0]];




always_ff@(posedge CLK)
	begin
		if(AVL_ADDR[11] && AVL_WRITE && AVL_CS)
			begin
				pallette[AVL_ADDR[2:0]] = AVL_WRITEDATA;
			end
		else if(AVL_ADDR[11] && AVL_READ && AVL_CS)
			begin
				AVL_READDATA = pallette[AVL_ADDR[2:0]];
			end
		else if(AVL_READ && AVL_CS)begin
			AVL_READDATA[31:0] = memory_output_a[31:0];
		end
	end
assign fontrow=CHAR[6:0]*16+drawY[3:0];
assign Inv=CHAR[7];

always_comb
	begin
		case(char)
			1'b0:begin
					CHAR = memory_output[14:8];
					BG_IDX = memory_output[3:0];
					FG_IDX = memory_output[7:4];
					end
			1'b1:begin
					CHAR=memory_output[31:24];
					BG_IDX = memory_output[19:16];
					FG_IDX = memory_output[23:20];
					end
			default:begin
					CHAR = memory_output[14:8];
					BG_IDX = memory_output[3:0];
					FG_IDX = memory_output[7:4];
					end
		endcase
	end
		
always_ff@(posedge pix_clk)//no glitching
	begin
	
	if(~blank)
		begin
			red<=4'b0;
			green<=4'b0;
			blue<=4'b0;
		end 
	
	else
		begin
		//Here we check if B^Inv is 1 or 0
			if(B^Inv)
				begin
					//This is foreground
					temp<=FG_IDX;
				end
			else
				begin
					temp <= BG_IDX;
				end
			 
			if(temp%2)
				begin
					//Upper bits
					red<=pallette[temp[3:1]][24:21];
					green<=pallette[temp[3:1]][20:17];
					blue<=pallette[temp[3:1]][16:13];
				end
			else begin
					//Lower Bits
					red<=pallette[temp[3:1]][12:9];
					green<=pallette[temp[3:1]][8:5];
					blue<=pallette[temp[3:1]][4:1];
				end
		end
end
		
endmodule
