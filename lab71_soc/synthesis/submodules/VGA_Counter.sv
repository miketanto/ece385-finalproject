//Author : Xinglong Sun
//Date : Nov.20 2019
//Copyright Xinglong Sun, all rights reserved

//Counter that mimics the DrawX and DrawY on the VGA screen
//Start from an initialized value

module VGA_Counter(input logic ctr_reset_vga, Clk, INIT_VGA, hold_vga,
	input logic [10:0] AddrX_Start, AddrY_Start, AddrX_Stop, AddrY_Stop,
	output logic [10:0] AddrX, AddrY);
	
	logic [10:0] X_count_in, Y_count_in, X_count, Y_count;
	assign AddrX = X_count;
	assign AddrY = Y_count;
	
	always_ff @(posedge Clk)
	begin
		if(ctr_reset_vga)
		begin
			X_count <= 11'd0;
			Y_count <= 11'd0;
		end
		else if(INIT_VGA)
		begin
			X_count <= AddrX_Start;
			Y_count <= AddrY_Start;
		end
		else
		begin
			X_count <= X_count_in;
			Y_count <= Y_count_in;
		end
	end
	
	always_comb
	begin
		if(hold_vga)
		begin
			X_count_in = X_count;
			Y_count_in = Y_count;
		end
		else
		begin
			X_count_in = X_count + 11'd1;
			Y_count_in = Y_count;
			if(X_count + 11'd1 == AddrX_Stop)
			begin
				X_count_in = AddrX_Start;
				if(Y_count + 11'd1 == AddrY_Stop)
					Y_count_in = 11'd0;
				else
					Y_count_in = Y_count_in + 11'd1;
			end
		end
	end
	
endmodule
