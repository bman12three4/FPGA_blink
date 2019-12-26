module counter (input clk, output reg [9:0]led);

reg [31:0] counter;

always @ (posedge clk)
begin
	if (counter <= 10000000)
	begin
		counter <= counter + 1;
	end
	else
	begin
		counter <= 0;
		if (led < 1023)
		begin
			led <= led + 1;
		end
		else
		begin
			led <= 0;
		end
	end
end

endmodule //simple