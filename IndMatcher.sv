module IndMatcher(
	input logic [9:0] Draw_Idx,
	input logic [10:0] AddrX_Start, AddrY_Start,
	output logic [10:0] SRAM_ADDR_X_Start, SRAM_ADDR_Y_Start);
	always_comb
	begin
		case(Draw_Idx)
			10'd0:
				begin
					SRAM_ADDR_X_Start = AddrX_Start;
					SRAM_ADDR_Y_Start = AddrY_Start;
				end
			10'd1:
				begin
					SRAM_ADDR_X_Start = 11'd0;
					SRAM_ADDR_Y_Start = 11'd481;
				end
			10'd2:
				begin
					SRAM_ADDR_X_Start = 11'd213;
					SRAM_ADDR_Y_Start = 11'd481;
				end
			10'd3:
				begin
					SRAM_ADDR_X_Start = 11'd425;
					SRAM_ADDR_Y_Start = 11'd481;
				end
			10'd4:
				begin
					SRAM_ADDR_X_Start = 11'd0;
					SRAM_ADDR_Y_Start = 11'd589;
				end
			10'd5:
				begin
					SRAM_ADDR_X_Start = 11'd213;
					SRAM_ADDR_Y_Start = 11'd589;
				end
			10'd6:
				begin
					SRAM_ADDR_X_Start = 11'd425;
					SRAM_ADDR_Y_Start = 11'd589;
				end
			10'd7:
				begin
					SRAM_ADDR_X_Start = 11'd0;
					SRAM_ADDR_Y_Start = 11'd698;
				end
			10'd8:
				begin
					SRAM_ADDR_X_Start = 11'd213;
					SRAM_ADDR_Y_Start = 11'd698;
				end
			10'd9:
				begin
					SRAM_ADDR_X_Start = 11'd425;
					SRAM_ADDR_Y_Start = 11'd698;
				end
			10'd10:
				begin
					SRAM_ADDR_X_Start = 11'd0;
					SRAM_ADDR_Y_Start = 11'd807;
				end
			10'd11:
				begin
					SRAM_ADDR_X_Start = 11'd213;
					SRAM_ADDR_Y_Start = 11'd807;
				end
			10'd12:
				begin
					SRAM_ADDR_X_Start = 11'd425;
					SRAM_ADDR_Y_Start = 11'd807;
				end
			10'd13:
				begin
					SRAM_ADDR_X_Start = 11'd0;
					SRAM_ADDR_Y_Start = 11'd914;
				end
			10'd14:
				begin
					SRAM_ADDR_X_Start = 11'd213;
					SRAM_ADDR_Y_Start = 11'd914;
				end
			10'd15:
				begin
					SRAM_ADDR_X_Start = 11'd425;
					SRAM_ADDR_Y_Start = 11'd914;
				end
			10'd16:
				begin
					SRAM_ADDR_X_Start = 11'd0;
					SRAM_ADDR_Y_Start = 11'd1024;
				end
			10'd17:
				begin
					SRAM_ADDR_X_Start = 11'd213;
					SRAM_ADDR_Y_Start = 11'd1024;
				end
			10'd18:
				begin
					SRAM_ADDR_X_Start = 11'd425;
					SRAM_ADDR_Y_Start = 11'd1024;
				end
			10'd19:
				begin
					SRAM_ADDR_X_Start = 11'd0;
					SRAM_ADDR_Y_Start = 11'd1132;
				end
			10'd20:
				begin
					SRAM_ADDR_X_Start = 11'd213;
					SRAM_ADDR_Y_Start = 11'd1132;
				end
			10'd21:
				begin
					SRAM_ADDR_X_Start = 11'd425;
					SRAM_ADDR_Y_Start = 11'd1132;
				end
			10'd22:
				begin
					SRAM_ADDR_X_Start = 11'd0;
					SRAM_ADDR_Y_Start = 11'd1241;
				end
			10'd23:
				begin
					SRAM_ADDR_X_Start = 11'd213;
					SRAM_ADDR_Y_Start = 11'd1241;
				end
			10'd24:
				begin
					SRAM_ADDR_X_Start = 11'd565;
					SRAM_ADDR_Y_Start = 11'd1412;
				end
			10'd25:
				begin
					SRAM_ADDR_X_Start = 11'd0;
					SRAM_ADDR_Y_Start = 11'd1472;
				end
			10'd26:
				begin
					SRAM_ADDR_X_Start = 11'd101;
					SRAM_ADDR_Y_Start = 11'd1472;
				end
			10'd27:
				begin
					SRAM_ADDR_X_Start = 11'd202;
					SRAM_ADDR_Y_Start = 11'd1472;
				end
			10'd28:
				begin
					SRAM_ADDR_X_Start = 11'd303;
					SRAM_ADDR_Y_Start = 11'd1472;
				end
			10'd29:
				begin
					SRAM_ADDR_X_Start = 11'd0;
					SRAM_ADDR_Y_Start = 11'd1556;
				end
			10'd30:
				begin
					SRAM_ADDR_X_Start = 11'd51;
					SRAM_ADDR_Y_Start = 11'd1556;
				end
			10'd31:
				begin
					SRAM_ADDR_X_Start = 11'd101;
					SRAM_ADDR_Y_Start = 11'd1556;
				end
			10'd32:
				begin
					SRAM_ADDR_X_Start = 11'd151;
					SRAM_ADDR_Y_Start = 11'd1556;
				end
			10'd41:
				begin
					SRAM_ADDR_X_Start = 11'd0;
					SRAM_ADDR_Y_Start = 11'd1410;
				end
			10'd42:
				begin
					SRAM_ADDR_X_Start = 11'd53;
					SRAM_ADDR_Y_Start = 11'd1410;
				end
			10'd43:
				begin
					SRAM_ADDR_X_Start = 11'd106;
					SRAM_ADDR_Y_Start = 11'd1410;
				end
			10'd44:
				begin
					SRAM_ADDR_X_Start = 11'd159;
					SRAM_ADDR_Y_Start = 11'd1410;
				end
			10'd51:
				begin
					SRAM_ADDR_X_Start = 11'd0;
					SRAM_ADDR_Y_Start = 11'd1360;
				end
			10'd52:
				begin
					SRAM_ADDR_X_Start = 11'd32;
					SRAM_ADDR_Y_Start = 11'd1360;
				end
			10'd53:
				begin
					SRAM_ADDR_X_Start = 11'd63;
					SRAM_ADDR_Y_Start = 11'd1360;
				end
			10'd54:
				begin
					SRAM_ADDR_X_Start = 11'd94;
					SRAM_ADDR_Y_Start = 11'd1360;
				end
			10'd55:
				begin
					SRAM_ADDR_X_Start = 11'd125;
					SRAM_ADDR_Y_Start = 11'd1360;
				end
			10'd56:
				begin
					SRAM_ADDR_X_Start = 11'd155;
					SRAM_ADDR_Y_Start = 11'd1360;
				end
			10'd57:
				begin
					SRAM_ADDR_X_Start = 11'd186;
					SRAM_ADDR_Y_Start = 11'd1360;
				end
			10'd58:
				begin
					SRAM_ADDR_X_Start = 11'd217;
					SRAM_ADDR_Y_Start = 11'd1360;
				end
			10'd61:
				begin
					SRAM_ADDR_X_Start = 11'd248;
					SRAM_ADDR_Y_Start = 11'd1360;
				end
			10'd62:
				begin
					SRAM_ADDR_X_Start = 11'd288;
					SRAM_ADDR_Y_Start = 11'd1360;
				end
			10'd63:
				begin
					SRAM_ADDR_X_Start = 11'd328;
					SRAM_ADDR_Y_Start = 11'd1360;
				end
			10'd64:
				begin
					SRAM_ADDR_X_Start = 11'd368;
					SRAM_ADDR_Y_Start = 11'd1360;
				end
			10'd71:
				begin
					SRAM_ADDR_X_Start = 11'd405;
					SRAM_ADDR_Y_Start = 11'd1367;
				end
			10'd72:
				begin
					SRAM_ADDR_X_Start = 11'd440;
					SRAM_ADDR_Y_Start = 11'd1367;
				end
			10'd73:
				begin
					SRAM_ADDR_X_Start = 11'd475;
					SRAM_ADDR_Y_Start = 11'd1367;
				end
			10'd74:
				begin
					SRAM_ADDR_X_Start = 11'd510;
					SRAM_ADDR_Y_Start = 11'd1367;
				end
			10'd81:
				begin
					SRAM_ADDR_X_Start = 11'd212;
					SRAM_ADDR_Y_Start = 11'd1410;
				end
			10'd82:
				begin
					SRAM_ADDR_X_Start = 11'd323;
					SRAM_ADDR_Y_Start = 11'd1410;
				end
			10'd83:
				begin
					SRAM_ADDR_X_Start = 11'd435;
					SRAM_ADDR_Y_Start = 11'd1410;
				end
			10'd84:
				begin
					SRAM_ADDR_X_Start = 11'd435;
					SRAM_ADDR_Y_Start = 11'd1453;
				end
			10'd85:
				begin
					SRAM_ADDR_X_Start = 11'd435;
					SRAM_ADDR_Y_Start = 11'd1493;
				end
			10'd91:
				begin
					SRAM_ADDR_X_Start = 11'd197;
					SRAM_ADDR_Y_Start = 11'd1556;
				end
			10'd92:
				begin
					SRAM_ADDR_X_Start = 11'd229;
					SRAM_ADDR_Y_Start = 11'd1556;
				end
			10'd93:
				begin
					SRAM_ADDR_X_Start = 11'd265;
					SRAM_ADDR_Y_Start = 11'd1556;
				end
			10'd94:
				begin
					SRAM_ADDR_X_Start = 11'd302;
					SRAM_ADDR_Y_Start = 11'd1556;
				end
			10'd95:
				begin
					SRAM_ADDR_X_Start = 11'd437;
					SRAM_ADDR_Y_Start = 11'd1541;
				end
			10'd96:
				begin
					SRAM_ADDR_X_Start = 11'd439;
					SRAM_ADDR_Y_Start = 11'd1580;
				end
			10'd97:
				begin
					SRAM_ADDR_X_Start = 11'd558;
					SRAM_ADDR_Y_Start = 11'd1493;
				end
			10'd98:
				begin
					SRAM_ADDR_X_Start = 11'd557;
					SRAM_ADDR_Y_Start = 11'd1520;
				end

			10'd99:
				begin
					SRAM_ADDR_X_Start = 11'd445;
					SRAM_ADDR_Y_Start = 11'd1240;
				end
			10'd100:
				begin
					SRAM_ADDR_X_Start = 11'd567;
					SRAM_ADDR_Y_Start = 11'd1473;
				end
			
			
			10'd101:
				begin
					SRAM_ADDR_X_Start = 11'd220;
					SRAM_ADDR_Y_Start = 11'd1595;
				end
			10'd102:
				begin
					SRAM_ADDR_X_Start = 11'd241;
					SRAM_ADDR_Y_Start = 11'd1595;
				end
			10'd103:
				begin
					SRAM_ADDR_X_Start = 11'd260;
					SRAM_ADDR_Y_Start = 11'd1595;
				end
			10'd104:
				begin
					SRAM_ADDR_X_Start = 11'd282;
					SRAM_ADDR_Y_Start = 11'd1595;
				end
			10'd105:
				begin
					SRAM_ADDR_X_Start = 11'd304;
					SRAM_ADDR_Y_Start = 11'd1595;
				end
			10'd106:
				begin
					SRAM_ADDR_X_Start = 11'd326;
					SRAM_ADDR_Y_Start = 11'd1595;
				end
			10'd107:
				begin
					SRAM_ADDR_X_Start = 11'd348;
					SRAM_ADDR_Y_Start = 11'd1595;
				end
			10'd108:
				begin
					SRAM_ADDR_X_Start = 11'd370;
					SRAM_ADDR_Y_Start = 11'd1595;
				end
			10'd109:
				begin
					SRAM_ADDR_X_Start = 11'd391;
					SRAM_ADDR_Y_Start = 11'd1595;
				end
			10'd110:
				begin
					SRAM_ADDR_X_Start = 11'd413;
					SRAM_ADDR_Y_Start = 11'd1595;
				end
			10'd111:
				begin
					SRAM_ADDR_X_Start = 11'd201;
					SRAM_ADDR_Y_Start = 11'd1595;
				end
			10'd112:
				begin
					SRAM_ADDR_X_Start = 11'd627;
					SRAM_ADDR_Y_Start = 11'd1492;
				end

			default:
				begin
					SRAM_ADDR_X_Start = 11'd0;
					SRAM_ADDR_Y_Start = 11'd0;
				end
		endcase
	end
endmodule
