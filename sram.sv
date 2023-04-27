module sram (
	input logic clock,
	input logic [19:0] address,
	output logic [15:0] q
);

logic [3:0] memory [307200] /* synthesis ram_init_file = "./testram.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
