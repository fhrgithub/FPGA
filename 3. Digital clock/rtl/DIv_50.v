module Div_50( CLOCK_50, RST_n, ENA, iDIV_Cont, oCLK);

input CLOCK_50;
input RST_n;
input ENA;
input [7:0] iDIV_Cont;
output oCLK;

reg oCLK_i = 1'b0;
reg [7:0] COUNTER = 8'b0;

assign oCLK = oCLK_i;

always @(posedge CLOCK_50, negedge RST_n, posedge ENA)
begin
	if(!RST_n)
	begin
		COUNTER <= 8'b0;
		end
	else if(ENA == 1'b1)
	begin
		if (COUNTER == iDIV_Cont/2 - 1'b1)
		begin
			COUNTER <= 8'b0;
			oCLK_i = ~oCLK_i;
		end
		else
			COUNTER <= COUNTER +1'b1;
	end
end

endmodule
