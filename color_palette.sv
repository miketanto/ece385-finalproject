module  color_palette (  input       [15:0] ColorIdx,
								//input [9:0] Draw_Idx,
                       output logic [3:0] VGA_R, VGA_G, VGA_B // VGA RGB output
                     );
    
    logic [3:0] Red, Green, Blue;
    
    // Output colors to VGA
    assign VGA_R = Red;
    assign VGA_G = Green;
    assign VGA_B = Blue;
    
    // Assign color based on is_ball signal
    always_comb
		begin
		case(ColorIdx)
			16'd0:
begin
    Red = 8'hc;
    Green = 8'hba;
    Blue = 8'hf3;
end

16'd1:
begin
    Red = 8'hfe;
    Green = 8'h0;
    Blue = 8'h0;
end

16'd2:
begin
    Red = 8'h81;
    Green = 8'hb5;
    Blue = 8'hca;
end

16'd3:
begin
    Red = 8'h60;
    Green = 8'h2e;
    Blue = 8'ha7;
end

16'd4:
begin
    Red = 8'hc;
    Green = 8'h6f;
    Blue = 8'ha6;
end

16'd5:
begin
    Red = 8'h8;
    Green = 8'h2;
    Blue = 8'h5;
end

16'd6:
begin
    Red = 8'h7f;
    Green = 8'hef;
    Blue = 8'hfd;
end

16'd7:
begin
    Red = 8'h7c;
    Green = 8'h48;
    Blue = 8'h40;
end

16'd8:
begin
    Red = 8'he3;
    Green = 8'hb6;
    Blue = 8'h30;
end

16'd9:
begin
    Red = 8'h40;
    Green = 8'h94;
    Blue = 8'hbd;
end

16'd10:
begin
    Red = 8'h15;
    Green = 8'ha6;
    Blue = 8'hda;
end

16'd11:
begin
    Red = 8'h4e;
    Green = 8'he5;
    Blue = 8'hfb;
end

16'd12:
begin
    Red = 8'h76;
    Green = 8'h83;
    Blue = 8'h81;
end

16'd13:
begin
    Red = 8'h8f;
    Green = 8'h62;
    Blue = 8'hbe;
end

16'd14:
begin
    Red = 8'hd0;
    Green = 8'he7;
    Blue = 8'hec;
end

16'd15:
begin
    Red = 8'h87;
    Green = 8'hf;
    Blue = 8'h13;
end

16'd16:
begin
    Red = 8'h1d;
    Green = 8'h88;
    Blue = 8'h83;
end

16'd17:
begin
    Red = 8'hd4;
    Green = 8'h20;
    Blue = 8'h26;
end

16'd18:
begin
    Red = 8'hf;
    Green = 8'h52;
    Blue = 8'h58;
end

16'd19:
begin
    Red = 8'hed;
    Green = 8'hdc;
    Blue = 8'h61;
end

16'd20:
begin
    Red = 8'h6;
    Green = 8'h25;
    Blue = 8'h7c;
end

16'd21:
begin
    Red = 8'h36;
    Green = 8'hd0;
    Blue = 8'hf0;
end

16'd22:
begin
    Red = 8'hca;
    Green = 8'h50;
    Blue = 8'h59;
end

16'd23:
begin
    Red = 8'h9d;
    Green = 8'hcd;
    Blue = 8'he7;
end

16'd24:
begin
    Red = 8'h38;
    Green = 8'h3a;
    Blue = 8'h3a;
end

16'd25:
begin
    Red = 8'h3c;
    Green = 8'h7;
    Blue = 8'h8;
end

16'd26:
begin
    Red = 8'he;
    Green = 8'h8c;
    Blue = 8'hbf;
end

16'd27:
begin
    Red = 8'h14;
    Green = 8'hb8;
    Blue = 8'hae;
end

16'd28:
begin
    Red = 8'hb3;
    Green = 8'hb0;
    Blue = 8'h90;
end

16'd29:
begin
    Red = 8'h7;
    Green = 8'h5f;
    Blue = 8'h7e;
end

16'd30:
begin
    Red = 8'h10;
    Green = 8'hd6;
    Blue = 8'hf7;
end

16'd31:
begin
    Red = 8'h4a;
    Green = 8'hc4;
    Blue = 8'h8f;
end
						  default:
							begin
								 Red = 8'h00;
								 Green = 8'h00;
								 Blue = 8'h00;
							end
						  endcase
    end 
    
endmodule
