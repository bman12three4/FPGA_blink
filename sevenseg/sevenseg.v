module sevenseg (input clk, output reg [6:0] hex0);

reg [31:0] counter;
reg [3:0] number;

always @ (posedge clk)
begin
	if (counter <= 25000000)
	begin
		counter <= counter + 1;
	end
	else
	begin
		counter <= 0;
		if (number < 15)
		begin
			number <= number + 1;
		end
		else
		begin
			number <= 0;
		end
		case (number)
			4'b0000 : hex0 <= ~63;	//0
			4'b0001 : hex0 <= ~6;	//1
			4'b0010 : hex0 <= ~91;	//2
			4'b0011 : hex0 <= ~79;	//3
			4'b0100 : hex0 <= ~102;	//4
			4'b0101 : hex0 <= ~109;	//5
			4'b0110 : hex0 <= ~125;	//6
			4'b0111 : hex0 <= ~7;	//7
			4'b1000 : hex0 <= ~127;	//8
			4'b1001 : hex0 <= ~103;	//9
			4'b1010 : hex0 <= ~119;	//A
			4'b1011 : hex0 <= ~124;	//b
			4'b1100 : hex0 <= ~57;	//C
			4'b1101 : hex0 <= ~94;	//d
			4'b1110 : hex0 <= ~121;	//E
			4'b1111 : hex0 <= ~113;	//F
		endcase	
	end
end

endmodule //sevenseg