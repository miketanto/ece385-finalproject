//Author : Xinglong Sun
//Date : Nov.20 2019
//Copyright Xinglong Sun, all rights reserved

//Counter that updates the SRAM address that blitter is supposed to fetch data from

module SRAM_Counter(input logic ctr_reset_sram, Clk, INIT_SRAM, hold_sram,
	input logic [10:0] SRAM_ADDR_X_Start, SRAM_ADDR_X_Stop,SRAM_ADDR_Y_Start, SRAM_ADDR_Y_Stop,
	output logic [19:0] SRAM_ADDR);
	
	logic [10:0] X_count_in, Y_count_in, X_count, Y_count;
	assign SRAM_ADDR = Y_count * 640 + X_count;		//Change this 640 to sprite sheet width. For now, just 640
	
	always_ff @(posedge Clk)
	begin
		if(ctr_reset_sram)
		begin
			X_count <= 11'd0;
			Y_count <= 11'd0;
		end
		else if(INIT_SRAM)
		begin
			X_count <= SRAM_ADDR_X_Start;
			Y_count <= SRAM_ADDR_Y_Start;
		end
		else
		begin
			X_count <= X_count_in;
			Y_count <= Y_count_in;
		end
	end
	
	always_comb
	begin
		if(hold_sram)
		begin
			X_count_in = X_count;
			Y_count_in = Y_count;
		end
		else
		begin
			X_count_in = X_count + 11'd1;
			Y_count_in = Y_count;
			if(X_count + 11'd1 == SRAM_ADDR_X_Stop)
			begin
				X_count_in = SRAM_ADDR_X_Start;
				if(Y_count + 11'd1 == SRAM_ADDR_Y_Stop)
					Y_count_in = 11'd0;
				else
					Y_count_in = Y_count_in + 11'd1;
			end
		end
	end
	
endmodule
