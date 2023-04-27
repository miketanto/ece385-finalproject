//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input 			[31:0] VRAM[9:0],
							  input        [9:0] DrawX, DrawY,
                       output logic [3:0]  Red, Green, Blue );
	
	
    
    logic [9:0] word_address;
	 logic on, inv;
	 logic [2:0] rom_column;
	 logic [4:0] x_progress;
	 logic [10:0] rom_addr;
	 logic [7:0] rom_data;
	 
	 font_rom rom(.addr(rom_addr), .data(rom_data));
	 
	 always_comb
    begin:Find_Address
		word_address = 10'((DrawX/32) * (DrawY/16));
    end 
	  
    always_comb
    begin:Set_rom_addr
		  x_progress = 5'(DrawX%32);
        if(x_progress >= 0 && x_progress <= 7)begin
				rom_addr = { VRAM[word_address][6:0], 4'b0000 };
				inv = VRAM[word_address][7];
				end
		  else if(x_progress >= 8 && x_progress <= 15)begin
				rom_addr = { VRAM[word_address][14:8], 4'b0000 };
				inv = VRAM[word_address][15];
				end
		  else if(x_progress >= 16 && x_progress <= 23)begin
				rom_addr = { VRAM[word_address][22:16], 4'b0000 };
				inv = VRAM[word_address][24];
				end
		  else if(x_progress >= 24 && x_progress <= 31)begin
				rom_addr = { VRAM[word_address][30:24], 4'b0000 };
				inv = VRAM[word_address][30];
				end
			//Set the next 4 rows
			rom_addr[3:0] = 4'(DrawY % 16);
     end 
      
	always_comb
    begin:on_proc
			rom_column = 3'(x_progress % 8);
        if ((rom_data[rom_column] ^ inv) == 1'b1) 
        begin 
            on = 1'b1;
        end       
        else 
        begin 
            on = 1'b0;
        end      
    end 
	 
    always_comb
    begin:RGB_Display
        if ((on == 1'b1)) 
        begin 
            Red = 4'hf;
            Green = 4'hf;
            Blue = 4'hf;
        end       
        else 
        begin 
            Red = 4'h0; 
            Green = 4'h0;
            Blue = 4'h0;
        end      
    end 
    
endmodule
