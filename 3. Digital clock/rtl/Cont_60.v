module Cont_60(
	input clk,
	input rst_n,
	input ena,
	input set,
	input [7:0]s_sm,
	output reg [7:0]sm,
	output reg carry
	);
	
	always@(posedge clk, negedge rst_n, posedge set, posedge ena)
	begin
		if(!rst_n)
		begin
			sm <= 8'b0;
			carry <= 1'b0;
		end
		else if(set)
		begin
			sm <= s_sm;
			carry <= 1'b0;
		end
		else if(ena)
		begin
			if(sm == 8'd59)
			begin
				sm <= 8'b0;
				carry <= 1'b1;
			end
			else
			begin
				sm <= sm + 1'b1;
				carry <= 1'b0;
			end
		end
			
	end
	
endmodule
	
	