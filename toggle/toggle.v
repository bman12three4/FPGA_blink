module toggle (input clk, input [9:0] switch, output reg [9:0] led);

reg [31:0] counter;
reg [9:0] temp_led;

always @ (posedge clk)
begin
	if (counter <= 25000000)
	begin
		counter <= counter + 1;
	end
	else
	begin
		counter <= 0;
		temp_led <= ~temp_led;
		led = temp_led & switch;
	end
end

endmodule //toggle