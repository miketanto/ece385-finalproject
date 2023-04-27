
module lab71_soc (
	blitter_addrx,
	blitter_addry,
	blitter_sram_addr,
	blitter_coloridxin,
	blitter_we,
	blitter_frame_done,
	clk_clk,
	hex_digits_export,
	key_external_connection_export,
	keycode_export,
	leds_export,
	reset_reset_n,
	run_external_connection_export,
	sdram_clk_clk,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	spi0_MISO,
	spi0_MOSI,
	spi0_SCLK,
	spi0_SS_n,
	usb_gpx_export,
	usb_irq_export,
	usb_rst_export);	

	output	[10:0]	blitter_addrx;
	output	[10:0]	blitter_addry;
	output	[19:0]	blitter_sram_addr;
	output	[7:0]	blitter_coloridxin;
	output		blitter_we;
	output		blitter_frame_done;
	input		clk_clk;
	output	[15:0]	hex_digits_export;
	input	[1:0]	key_external_connection_export;
	output	[7:0]	keycode_export;
	output	[13:0]	leds_export;
	input		reset_reset_n;
	input		run_external_connection_export;
	output		sdram_clk_clk;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[15:0]	sdram_wire_dq;
	output	[1:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	input		spi0_MISO;
	output		spi0_MOSI;
	output		spi0_SCLK;
	output		spi0_SS_n;
	input		usb_gpx_export;
	input		usb_irq_export;
	output		usb_rst_export;
endmodule
