module FrameBuffer(input logic Clk, We, Reset_h,
	input [10:0] AddrX, AddrY,
	input [10:0] Read_AddrX, Read_AddrY,
	input logic [7:0] ColorIdxIn,
	input logic [7:0] Color_Filter,
	output logic [7:0] ColorIdxOut);
	
	logic [4:0] frame_buf[640 * 480];
	always_ff @(posedge Clk)
	begin
		if(We)
			begin
				if((ColorIdxIn != Color_Filter) && (AddrX >= 0 && AddrX < 640) && (AddrY >= 0 && AddrY < 480))
					frame_buf[AddrY * 640 + AddrX] <= ColorIdxIn[4:0];
			end
		ColorIdxOut <= {{3{1'b0}},frame_buf[Read_AddrY * 640 + Read_AddrX]};
	end
endmodule
