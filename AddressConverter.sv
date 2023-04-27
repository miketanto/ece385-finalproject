module AddressConverter(
	input logic [9:0] DrawX, DrawY, Fish_X_Pos_Out, Fish_Y_Pos_Out,
	input logic is_Fish,
	//input int height, width,
	output logic [19:0] SRAM_ADDR);
	logic [9:0] offset;
	
	always_comb
	begin
		if(is_Fish)
			SRAM_ADDR = 480 * 640 + (DrawY-Fish_Y_Pos_Out)*30 + (DrawX-Fish_X_Pos_Out);
		else
			SRAM_ADDR = DrawY * 640 + DrawX;
	end
	
endmodule
