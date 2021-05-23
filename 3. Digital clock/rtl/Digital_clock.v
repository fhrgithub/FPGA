module Digital_clock (
	input clk,
	input rst_n,
	input ena,
	input set,
	input [7:0]s_hh,
	input [7:0]s_mm,
	input [7:0]s_ss,
	output  [7:0]hh,
	output  [7:0]mm,
	output  [7:0]ss
	);
	
	wire sm_c, mh_c;
	wire CLK_1Hz;
	
	Div_50 u1( .CLOCK_50(clk), .RST_n(rst_n), .ENA(1'b1), .iDIV_Cont(8'd50), .oCLK(CLK_1Hz) );
	Cont_60 u2( .clk(clk),  	.rst_n(rst_n), 	.ena(ena), 		.set(set), 	.s_sm(s_ss), 	.sm(ss), 	.carry(sm_c) );
	Cont_60 u3( .clk(sm_c), 	.rst_n(rst_n), 	.ena(1'b1), 	.set(set), 	.s_sm(s_mm), 	.sm(mm), 	.carry(mh_c) );
	Cont_24 u4( .clk(mh_c), 	.rst_n(rst_n), 	.ena(1'b1), 	.set(set), 	.s_hh(s_hh), 	.hh(hh) );
	
endmodule

	

/*
module Digital_clock (
	input clk,
	input rst_n,
	input set,
	input [7:0]s_hh,
	input [7:0]s_mm,
	input [7:0]s_ss,
	output reg [7:0]hh,
	output reg [7:0]mm,
	output reg [7:0]ss
	);
	
	reg sm_c, mh_c;
	wire CLK_1Hz;
	
	Div_50 u1( .CLOCK_50(clk), .RST_n(rst_n), .ENA(1'b1), .iDIV_Cont(8'd50), .oCLK(CLK_1Hz));
	
	
	always@(posedge clk)
		if(!rst_n)
		begin
			ss <= 8'b0;
			sm_c <= 1'b0;
		end
		else if(set)
		begin
			ss <= s_ss;
			sm_c <= 1'b0;
		end
		else if(ss == 8'd59)
		begin
			ss <= 8'b0;
			sm_c <= 1'b1;
		end
		else
		begin
			ss <= ss + 1'b1;
			sm_c <= 1'b0;
		end
	
	always@(posedge CLK_1Hz)
		if(!rst_n)
		begin
			mm <= 8'b0;
			mh_c <= 1'b0;
		end
		else if(set)
		begin
			mm <= s_mm;
			mh_c <= 1'b0;
		end
		else if(sm_c == 1'b1)
			if(mm == 8'h59)
			begin
				mm <= 8'b0;
				mh_c <= 1'b1;
			end
			else
			begin
				mm <= mm + 1'b1;
				mh_c <= 1'b0;
			end
		else
			mh_c <= 1'b0;
	
	always@(posedge CLK_1Hz)
		if(!rst_n)
		begin
			hh <= 8'b0;
		end
		else if(set)
		begin
			hh <= s_hh;
		end
		else if(mh_c == 1'b1)
			if(hh == 8'h23)
			begin
				hh <= 8'b0;
			end
			else
			begin
				hh <= hh + 1'b1;
			end

endmodule

*/

