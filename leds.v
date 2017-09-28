module top(input CLOCK_50, input [3:0]SW,  output reg [7:0]LEDR, output reg [0:0]LEDG);

reg[31:0] counter;
reg[3:0] soma=1;

always @(posedge CLOCK_50)
begin
	if(counter<=50000000)
	begin
		counter<= counter+soma;
	end
	else
	begin
		counter<=0;
		LEDR[0]<=~LEDR[0];
	end
		if(SW[0]==1)
		begin
			soma=10;
		end
		if(SW[1]==1)
		begin
			soma=20;
		end
		if(SW[2]==1)
		begin
			soma=30;
		end
	if(counter == 25000000)
	begin 
		LEDG <=~LEDG;
	end
		
	
end
endmodule