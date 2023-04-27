//-------------------------------------------------------------------------
//      Mem2IO.vhd                                                       --
//      Stephen Kempf                                                    --
//                                                                       --
//      Revised 03-15-2006                                               --
//              03-22-2007                                               --
//              07-26-2013                                               --
//              03-04-2014                                               --
//              02-13-2017                                               --
//                                                                       --
//      For use with ECE 385 Experiment 6                                --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module  SRAM_Controller ( 	input logic Clk, Reset_h,
					input logic [15:0] Data_Write,
					input logic SRAM_CE_N, SRAM_UB_N, SRAM_LB_N, SRAM_OE_N, SRAM_WE_N,
					output logic [15:0] Data_Read,
					inout[15:0] SRAM_DQ);

	// Always read data from the bus
	logic[15:0] Data_read_buffer, Data_write_buffer;
	always_ff @ (posedge Clk)
    begin 
		Data_read_buffer <= SRAM_DQ;
		Data_write_buffer <= Data_Write;
    end

// Drive (write to) Data bus only when tristate_output_enable is active.
assign SRAM_DQ = (~SRAM_WE_N && SRAM_OE_N) ? Data_write_buffer : {16{1'bZ}};

assign Data_Read = Data_read_buffer;


endmodule
