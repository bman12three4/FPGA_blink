module vga (
	input clk, 
	output reg [3:0] redvga,
	output reg [3:0] grnvga,
	output reg [3:0] bluvga,
	output reg hsync, 
	output reg vsync
	);
	
	reg [14:0] counter;
	reg [10:0] vgatimer;
	reg [9:0] line;
	reg [3:0] grad;
	reg [2:0] color;
	
	reg [3:0] tmpredvga;
	reg [3:0] tmpgrnvga;
	reg [3:0] tmpbluvga;
	
	always @ (posedge clk)
	begin
		if (line == 0 && vgatimer == 0)
		begin
			counter <= counter + 1;
		end
		if (counter >= 5)
		begin
			counter <= 0;
			if (grad < 15)
			begin
				grad = grad + 1;
				tmpredvga <= tmpredvga + color[0];
				tmpgrnvga <= tmpgrnvga + color[1];
				tmpbluvga <= tmpbluvga + color[2];
			end
			else
			begin
				grad <= 0;
				tmpredvga <= 0;
				tmpgrnvga <= 0;
				tmpbluvga <= 0;
				if (color < 7)
				begin
					color <= color + 1;
				end
				else
				begin
					color <= 0;
				end
			end
		end
		
		if (vgatimer <= 190)
		begin
			hsync <= 0;
			redvga <= 0;
			grnvga <= 0;
			bluvga <= 0;
			vgatimer <= vgatimer + 1;
		end
		else if (vgatimer <= 285)
		begin
			hsync <= 1;
			redvga <= 0;
			grnvga <= 0;
			bluvga <= 0;
			vgatimer <= vgatimer + 1;
		end
		else if (vgatimer <= 1555)
		begin
			hsync <= 1;
			redvga <= tmpredvga;
			grnvga <= tmpgrnvga;
			bluvga <= tmpbluvga;
			vgatimer <= vgatimer + 1;
		end
		else if (vgatimer <= 1585)
		begin
			hsync <= 1;
			redvga <= 0;

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