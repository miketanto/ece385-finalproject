//Connection-interface between AVALON Interface, SRAM, and Frame Buffer
//Act as a draw engine

//Author : Xinglong Sun
//Date : Nov.20 2019
//Copyright Xinglong Sun, all rights reserved
/**Specifications:
Stops are one pixel past the boundary
**/
module blitter(
	input logic Clk, Reset_h, Draw_Start,
	input logic [10:0] AddrX_Start, AddrY_Start, AddrX_Stop, AddrY_Stop,
	input logic [10:0] SRAM_ADDR_X_Start, SRAM_ADDR_Y_Start,
	//input logic [7:0] Color_Filter,
	
	output logic [10:0] AddrX, AddrY,	//Location on the buffer
	output logic [19:0] SRAM_ADDR,	//Location on the SRAM
	output logic [7:0] ColorIdxIn, ////Data input to the Frame Buffer
	output logic We,
	output logic Draw_Done);	//Drawing is complete	

	/*********Counter Related Signals*************/
	//logic [9:0] AddrX_Start, AddrY_Start, AddrX_Stop, AddrY_Stop;
	//logic [9:0] SRAM_ADDR_X_Start, SRAM_ADDR_Y_Start, SRAM_ADDR_X_Stop, SRAM_ADDR_Y_Stop;
	logic [10:0] SRAM_ADDR_X_Stop,SRAM_ADDR_Y_Stop;
	logic ctr_reset_vga,ctr_reset_sram;
	logic INIT_VGA, INIT_SRAM;
	logic hold_vga, hold_sram;
	
	
	/*******INIT*************/
	logic [15:0] Data_Read;
	assign Data_Read = 16'h00;
	//sram sram0(.clock(Clk), .address(SRAM_ADDR), .q(Data_Read));

	assign ColorIdxIn = Data_Read[7:0];
	assign SRAM_ADDR_X_Stop = SRAM_ADDR_X_Start + (AddrX_Stop - AddrX_Start);
	assign SRAM_ADDR_Y_Stop = SRAM_ADDR_Y_Start + (AddrY_Stop - AddrY_Start);
	
	VGA_Counter vgact0(.*);	//VGA Counter
	SRAM_Counter sramct0(.*);	//SRAM Counter
	
	enum logic [2:0] {Reset, INIT, Read_From_SRAM, WRITE_TO_VGA, DONE} State, Next_State;
	//FSM Implementation
	always_ff @(posedge Clk)
	begin
		if(Reset_h)
			State <= Reset;
		else
			State <= Next_State;
	end
	
	always_comb
	begin
	Next_State = State;
	ctr_reset_vga = 1'b0;
	ctr_reset_sram = 1'b0;
	We = 1'b0;
	INIT_VGA = 1'b0;
	INIT_SRAM = 1'b0;
	hold_vga = 1'b0;
	hold_sram = 1'b0;
	Draw_Done = 1'b0;
		unique case (State)
			Reset:
			begin
				ctr_reset_vga = 1'b1;
				ctr_reset_sram = 1'b1;
				if(Draw_Start)
					Next_State = INIT;
			end
			INIT:
			begin
				hold_vga = 1'b1;
				hold_sram = 1'b1;
				INIT_VGA = 1'b1;
				INIT_SRAM = 1'b1;
				Next_State = Read_From_SRAM;
			end
			
			Read_From_SRAM:
			begin
				hold_vga = 1'b1;
				Next_State = WRITE_TO_VGA;
			end
			
			WRITE_TO_VGA:	//One Clock Cycle from Read should be enough
			begin
				hold_sram = 1'b1;
				We = 1'b1;
				if(AddrX == AddrX_Stop - 1 && AddrY == AddrY_Stop - 1)
					Next_State = DONE;
				else
					Next_State = Read_From_SRAM;
			end
			
			DONE:
			begin
				Draw_Done = 1'b1;
				if(~Draw_Start)
					Next_State = Reset;
			end
			
		endcase
	end
	
endmodule
