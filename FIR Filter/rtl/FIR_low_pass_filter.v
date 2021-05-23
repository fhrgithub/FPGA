
module FIR_low_pass_filter(
	input CLK,
	input RSTn,
	input [7:0]FIR_IN,
	output reg [16:0]FIR_OUT
);
	

//=============================================================================================
//这一级的功能是将输入信号进行延时，每到来一个时钟信号，便将输入信号保存到delay_pipelin1中，然后将剩下的依次移动一位。


reg[7:0] delay_pipeline1;
reg[7:0] delay_pipeline2;
reg[7:0] delay_pipeline3;
reg[7:0] delay_pipeline4;
reg[7:0] delay_pipeline5;
reg[7:0] delay_pipeline6;
reg[7:0] delay_pipeline7;
reg[7:0] delay_pipeline8;
reg[7:0] delay_pipeline9;
//-------------------------
wire[7:0] coeff1 = 8'd7;	//滤波器系数
wire[7:0] coeff2 = 8'd5;
wire[7:0] coeff3 = 8'd51;
wire[7:0] coeff4 = 8'd135;
wire[7:0] coeff5 = 8'd179;
wire[7:0] coeff6 = 8'd135;
wire[7:0] coeff7 = 8'd51;
wire[7:0] coeff8 = 8'd5;
wire[7:0] coeff9 = 8'd7;

reg signed [16:0] multi_data1 ;//乘积结果
reg signed [16:0] multi_data2 ;
reg signed [16:0] multi_data3 ;
reg signed [16:0] multi_data4 ;
reg signed [16:0] multi_data5 ;
reg signed [16:0] multi_data6 ;
reg signed [16:0] multi_data7 ;
reg signed [16:0] multi_data8 ;
reg signed [16:0] multi_data9 ;



always@(posedge CLK or negedge RSTn)
if(!RSTn)
begin
	delay_pipeline1 <= 8'b0 ;
	delay_pipeline2 <= 8'b0 ;
	delay_pipeline3 <= 8'b0 ;
	delay_pipeline4 <= 8'b0 ;
	delay_pipeline5 <= 8'b0 ;
	delay_pipeline6 <= 8'b0 ;
	delay_pipeline7 <= 8'b0 ;
	delay_pipeline8 <= 8'b0 ;
	delay_pipeline9 <= 8'b0 ;
end
else
begin
	delay_pipeline1 <= FIR_IN;
	delay_pipeline2 <= delay_pipeline1 ;
	delay_pipeline3 <= delay_pipeline2 ;
	delay_pipeline4 <= delay_pipeline3 ;
	delay_pipeline5 <= delay_pipeline4 ;
	delay_pipeline6 <= delay_pipeline5 ;
	delay_pipeline7 <= delay_pipeline6 ;
	delay_pipeline8 <= delay_pipeline7 ;
	delay_pipeline9 <= delay_pipeline8 ;
end


//=============================================================================================
//这一级的功能是将输入经过延时的信号和滤波器系数相乘，每到来一个时钟便将一个新的乘积结果更新到multi_data中。



always@(posedge CLK or negedge RSTn) //x(0) * h(0)
	if(!RSTn)
		multi_data1 <= 17'b0 ;
	else
		multi_data1 <= delay_pipeline1*coeff1 ;
		
always@(posedge CLK or negedge RSTn) //x(1) * h(1)
	if(!RSTn)
		multi_data2 <= 17'b0 ;
	else
		multi_data2 <= delay_pipeline2*coeff2 ;

always@(posedge CLK or negedge RSTn) //x(1) * h(1)
	if(!RSTn)
		multi_data3 <= 17'b0 ;
	else
		multi_data3 <= delay_pipeline3*coeff3 ;
		
always@(posedge CLK or negedge RSTn) //x(1) * h(1)
	if(!RSTn)
		multi_data4 <= 17'b0 ;
	else
		multi_data4 <= delay_pipeline4*coeff4 ;
		
always@(posedge CLK or negedge RSTn) //x(1) * h(1)
	if(!RSTn)
		multi_data5 <= 17'b0 ;
	else
		multi_data5 <= delay_pipeline5*coeff5 ;
		
always@(posedge CLK or negedge RSTn) //x(1) * h(1)
	if(!RSTn)
		multi_data6 <= 17'b0 ;
	else
		multi_data6 <= delay_pipeline6*coeff6 ;
		
always@(posedge CLK or negedge RSTn) //x(1) * h(1)
	if(!RSTn)
		multi_data7 <= 17'b0 ;
	else
		multi_data7 <= delay_pipeline7*coeff7 ;
		
always@(posedge CLK or negedge RSTn) //x(1) * h(1)
	if(!RSTn)
		multi_data8 <= 17'b0 ;
	else
		multi_data8 <= delay_pipeline8*coeff8 ;
		
always@(posedge CLK or negedge RSTn) //x(1) * h(1)
	if(!RSTn)
		multi_data9 <= 17'b0 ;
	else
		multi_data9 <= delay_pipeline9*coeff9 ;
//=================================================================================
//这一级的主要功能是将乘积累加，累加的结果就是滤波后的信号。

always@(posedge CLK or negedge RSTn)
	if(!RSTn)
		FIR_OUT <= 16'b0 ;
	else
		FIR_OUT <= multi_data1 + multi_data2 + multi_data3 + multi_data4 +multi_data5 + multi_data6 + multi_data7 + multi_data8 + multi_data9 ;
		
endmodule
