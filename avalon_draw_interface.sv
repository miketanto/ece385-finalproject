/************************************************************************
Avalon-MM Interface for Blitter Drawing IP Core
//Author : Xinglong Sun
//Date : Nov.20 2019
//Copyright Xinglong Sun, all rights reserved



Register Map:

0 : Item/Object Index	Indicate the object or the pattern you want to draw
1 : VGA Screen X Location of the item	(Top left Pixel coordinate)
2 : VGA Screen Y Location of the item	(Top left Pixel coordinate)
3 : VGA Screen X Location of the item	(Bottom Right Pixel coordinate)
4 : VGA Screen Y Location of the item	(Bottom Right Pixel coordinate)
5 : Reserved
6 : Draw_Start
7 : Draw_Done
************************************************************************/

module avalon_draw_interface (
	// Avalon Clock Input
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,						// Avalon-MM Chip Select
	input  logic [2:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,	// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,	// Avalon-MM Read Data
	output logic [10:0] AddrX, AddrY,	//Location on the buffer
	output logic [19:0] SRAM_ADDR,	//Location on the SRAM
	output logic [7:0] ColorIdxIn, ////Data input to the Frame Buffer
	output logic We, Frame_Done
);

logic [31:0] reg_file[8];
//0 Draw Indx
//1 X start
//2 Y start
//3 X end
//4 Y end
//5 
//6 need draw
//7 draw done

logic Draw_Done;
logic [9:0] Draw_Idx;

always_ff @(posedge CLK)
begin
	if(RESET)
		begin
			for(int i = 0; i<8; i++)
				reg_file[i] <= {32{1'b0}};
		end
	else if(AVL_WRITE && AVL_CS)
		begin
			reg_file[AVL_ADDR] <= AVL_WRITEDATA;
		end
	else
		begin
			reg_file[7] <= {{31{1'b0}},Draw_Done};
		end
end

logic [10:0] SRAM_ADDR_X_Start, SRAM_ADDR_Y_Start;
//assign SRAM_ADDR_X_Start = 0;
//assign SRAM_ADDR_Y_Start = 0;


assign AVL_READDATA = (AVL_CS && AVL_READ) ? reg_file[AVL_ADDR] : {32{1'b0}};
//assign EXPORT_DATA = {reg_file[4][31:16],reg_file[7][15:0]};

logic Draw_Start;
//assign Draw_Start = 1;
logic [10:0] AddrX_Start, AddrY_Start, AddrX_Stop, AddrY_Stop;
assign Draw_Start = reg_file[6][0];
assign Draw_Idx = reg_file[0][9:0];
assign AddrX_Start = reg_file[1][10:0];
assign AddrY_Start = reg_file[2][10:0];
assign AddrX_Stop = reg_file[3][10:0];
assign AddrY_Stop = reg_file[4][10:0];
assign Frame_Done = reg_file[5][0];
//assign AddrX_Start = 0;
//assign AddrY_Start = 0;
//assign AddrX_Stop = 10'd640;
//assign AddrY_Stop = 10'd480;
IndMatcher im0(.*);
blitter bt0(.*,.Clk(CLK),.Reset_h(RESET));

endmodule
