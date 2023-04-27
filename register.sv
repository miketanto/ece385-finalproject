module register #(parameter N = 32)
	(input logic [N-1:0] d_in,
	input logic CLK,RESET,LD,
	output logic [N-1:0] d_out);
	
	always_ff @(posedge CLK)
	begin
		if(RESET)
			d_out <= {N{1'b0}};
		else if (LD)
			d_out <= d_in;
	end
endmodule