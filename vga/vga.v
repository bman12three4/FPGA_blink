module vga (input clk, output reg [3:0] vgadat, output reg hsync, output reg vsync);
	
	reg [31:0] counter;
	reg [31:0] vgatimer;
	reg [9:0] line;
	
	reg [3:0] redvga;
	
	always @ (posedge clk)
	begin
		if (counter <= 5000000)
		begin
			counter <= counter + 1;
		end
		else
		begin
			counter  <= 0;
			if (redvga < 15)
			begin
				redvga <= redvga + 1;
			end
			else
			begin
				redvga <= 0;
			end
		end
		
		if (vgatimer <= 190)
		begin
			hsync <= 0;
			vgadat <= 0;
			vgatimer <= vgatimer + 1;
		end
		else if (vgatimer <= 285)
		begin
			hsync <= 1;
			vgadat <= 0;
			vgatimer <= vgatimer + 1;
		end
		else if (vgatimer <= 1555)
		begin
			hsync <= 1;
			vgadat <= redvga;
			vgatimer <= vgatimer + 1;
		end
		else if (vgatimer <= 1585)
		begin
			hsync <= 1;
			vgadat <= 0;
			vgatimer <= vgatimer + 1;
		end
		else 
		begin
			vgatimer <= 0;
			if (line < 525)
			begin
				line <= line + 1;
			end
			else 
			begin
				line <= 0;
			end
		end
		
		if (line <=2)
		begin
			vsync <= 0;
		end
		else if (line <= 35)
		begin
			vsync <= 1;
		end
	end
	
endmodule //vga