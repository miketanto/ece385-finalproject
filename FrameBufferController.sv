//Double Buffer Controller

module FrameBufferController(input logic Clk, We, Reset_h, Frame_Done,
	input [10:0] AddrX, AddrY,
	input [10:0] Read_AddrX, Read_AddrY,
	input logic [7:0] ColorIdxIn,
	input logic [7:0] Color_Filter,
	output logic [7:0] ColorIdxOut);

	/****VGA Related Signals****/
	logic ctr_reset_vga, INIT_VGA, hold_vga;
	logic [10:0] AddrX_Start, AddrY_Start, AddrX_Stop, AddrY_Stop;
	logic [10:0] AddrX_ctr, AddrY_ctr;
	
	assign AddrX_Start = 11'd0;
	assign AddrY_Start = 11'd0;
	assign AddrX_Stop = 11'd640;
	assign AddrY_Stop = 11'd480;
	
	/****Frame Buffer Related Signals****/
	logic We0, We1;
	logic [10:0] AddrX0, AddrX1, AddrY0,AddrY1;
	logic [10:0] Read_AddrX0, Read_AddrX1, Read_AddrY0, Read_AddrY1;
	logic [7:0] ColorIdxIn0, ColorIdxIn1;
	logic [7:0] ColorIdxOut0, ColorIdxOut1;
	
	assign ColorIdxIn0 = ColorIdxIn;
	assign AddrX0 = AddrX;
	assign AddrY0 = AddrY;
	assign We0 = We;
	assign We1 = Frame_Done;
	assign Read_AddrX1 = Read_AddrX;
	assign Read_AddrY1 = Read_AddrY;
	assign ColorIdxOut = ColorIdxOut1;
	assign ColorIdxIn1 = ColorIdxOut0;
	assign Read_AddrX0 = AddrX_ctr;
	assign Read_AddrY0 = AddrY_ctr;
	assign AddrX1 = AddrX_ctr;
	assign AddrY1 = AddrY_ctr;
	
	VGA_Counter vgact0(.*,.AddrX(AddrX_ctr),.AddrY(AddrY_ctr));	//VGA Counter
	
	FrameBuffer fb0(.*,.We(We0), .AddrX(AddrX0), .AddrY(AddrY0), .Read_AddrX(Read_AddrX0), 
		.Read_AddrY(Read_AddrY0), .ColorIdxIn(ColorIdxIn0), .ColorIdxOut(ColorIdxOut0));	//Cache connected to fb1 and blitter
		
	
	FrameBuffer fb1(.*,.We(We1), .AddrX(AddrX1), .AddrY(AddrY1), .Read_AddrX(Read_AddrX1), 
		.Read_AddrY(Read_AddrY1), .ColorIdxIn(ColorIdxIn1), .ColorIdxOut(ColorIdxOut1));	//Directly connect to VGA
	
	
	enum logic [1:0] {INIT, COPYFIRST, COPY} State, Next_State;
	
	always_ff @(posedge Clk)
	begin
		if(Reset_h)
			State <= INIT;
		else
			State <= Next_State;
	end
	
	always_comb
	begin
	Next_State = State;
	ctr_reset_vga = 1'b0;
	INIT_VGA = 1'b0;
	hold_vga = 1'b0;
		unique case (State)
			INIT:
			begin
				hold_vga = 1'b1;
				INIT_VGA = 1'b1;
				Next_State = COPYFIRST;
			end
			COPYFIRST:
			begin
				INIT_VGA = 1'b1;
				Next_State = COPY;
			end
			COPY:
			begin
				if(AddrX_ctr == 10'd639 && AddrY_ctr == 10'd479)
					Next_State = INIT;
			end
		endcase
	end
	
endmodule
