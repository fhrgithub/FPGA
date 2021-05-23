module Cont_24(
	input clk,
	input rst_n,
	input ena,
	input set,
	input [7:0]s_hh,
	output reg [7:0]hh
	);
	
	always@(posedge clk, negedge rst_n, posedge set)
	begin
		if(!rst_n)
		begin
			hh <= 8'b0;
		end
		else if(set)
		begin
			hh <= s_hh;
		end
		else if(ena)
		begin
			if(hh == 8'd23)
			begin
				hh <= 8'b0;
			end
			else
				hh <= hh + 1'b1;
		end
	end
	
endmodule
	
	