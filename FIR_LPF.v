`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:05:26 09/04/2021 
// Design Name: 
// Module Name:    fir_test 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
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
reg[7:0] delay_pipeline10;
reg[7:0] delay_pipeline11;
reg[7:0] delay_pipeline12;
reg[7:0] delay_pipeline13;
reg[7:0] delay_pipeline14;
reg[7:0] delay_pipeline15;
reg[7:0] delay_pipeline16;
reg[7:0] delay_pipeline17;
reg[7:0] delay_pipeline18;
reg[7:0] delay_pipeline19;
reg[7:0] delay_pipeline20;
reg[7:0] delay_pipeline21;
//-------------------------
wire[7:0] coeff1 = 8'd3;	//      滤波器系数 3     4     6    10    15    20    25    30    34    36    37    36    34    30    25    20    15    10     6     4     3
wire[7:0] coeff2 = 8'd4;      //      滤波器系数 2     3     5     9    14    19    25    30    35    37    38    37    35    30    25    19    14     9     5     3     2
wire[7:0] coeff3 = 8'd6;      //fc=24k滤波器系数 3     4     6    10    15    20    25    30    34    36    37    36    34    30    25    20    15    10     6     4     3
wire[7:0] coeff4 = 8'd10;
wire[7:0] coeff5 = 8'd15;
wire[7:0] coeff6 = 8'd20;
wire[7:0] coeff7 = 8'd25;
wire[7:0] coeff8 = 8'd30;
wire[7:0] coeff9 = 8'd34;
wire[7:0] coeff10 = 8'd36;
wire[7:0] coeff11 = 8'd37;	//滤波器系数 20    23    50   117   159   117    50    23    20
wire[7:0] coeff12 = 8'd36;
wire[7:0] coeff13 = 8'd34;
wire[7:0] coeff14 = 8'd30;
wire[7:0] coeff15 = 8'd25;
wire[7:0] coeff16 = 8'd20;
wire[7:0] coeff17 = 8'd15;
wire[7:0] coeff18 = 8'd10;
wire[7:0] coeff19 = 8'd6;
wire[7:0] coeff20 = 8'd4;
wire[7:0] coeff21 = 8'd3;

reg signed [16:0] multi_data1 ;//乘积结果
reg signed [16:0] multi_data2 ;
reg signed [16:0] multi_data3 ;
reg signed [16:0] multi_data4 ;
reg signed [16:0] multi_data5 ;
reg signed [16:0] multi_data6 ;
reg signed [16:0] multi_data7 ;
reg signed [16:0] multi_data8 ;
reg signed [16:0] multi_data9 ;
reg signed [16:0] multi_data10 ;//乘积结果
reg signed [16:0] multi_data11 ;//乘积结果
reg signed [16:0] multi_data12 ;
reg signed [16:0] multi_data13 ;
reg signed [16:0] multi_data14 ;
reg signed [16:0] multi_data15 ;
reg signed [16:0] multi_data16 ;
reg signed [16:0] multi_data17 ;
reg signed [16:0] multi_data18 ;
reg signed [16:0] multi_data19 ;
reg signed [16:0] multi_data20 ;//乘积结果
reg signed [16:0] multi_data21 ;



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
	delay_pipeline10 <= 8'b0 ;
	delay_pipeline11 <= 8'b0 ;
	delay_pipeline12 <= 8'b0 ;
	delay_pipeline13 <= 8'b0 ;
	delay_pipeline14 <= 8'b0 ;
	delay_pipeline15 <= 8'b0 ;
	delay_pipeline16 <= 8'b0 ;
	delay_pipeline17 <= 8'b0 ;
	delay_pipeline18 <= 8'b0 ;
	delay_pipeline19 <= 8'b0 ;
	delay_pipeline20 <= 8'b0 ;
	delay_pipeline21 <= 8'b0 ;
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
	delay_pipeline10 <= delay_pipeline9 ;
	delay_pipeline11 <= delay_pipeline10;
	delay_pipeline12 <= delay_pipeline11 ;
	delay_pipeline13 <= delay_pipeline12 ;
	delay_pipeline14 <= delay_pipeline13 ;
	delay_pipeline15 <= delay_pipeline14 ;
	delay_pipeline16 <= delay_pipeline15 ;
	delay_pipeline17 <= delay_pipeline16 ;
	delay_pipeline18 <= delay_pipeline17 ;
	delay_pipeline19 <= delay_pipeline18 ;
	delay_pipeline20 <= delay_pipeline19 ;
	delay_pipeline21 <= delay_pipeline20;
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

always@(posedge CLK or negedge RSTn) //x(2) * h(2)
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
always@(posedge CLK or negedge RSTn) //x(0) * h(0)
	if(!RSTn)
		multi_data10 <= 17'b0 ;
	else
		multi_data10 <= delay_pipeline10*coeff10 ;
		
always@(posedge CLK or negedge RSTn) //x(0) * h(0)
	if(!RSTn)
		multi_data11 <= 17'b0 ;
	else
		multi_data11 <= delay_pipeline11*coeff11 ;
		
always@(posedge CLK or negedge RSTn) //x(1) * h(1)
	if(!RSTn)
		multi_data12 <= 17'b0 ;
	else
		multi_data12 <= delay_pipeline12*coeff12 ;

always@(posedge CLK or negedge RSTn) //x(1) * h(1)
	if(!RSTn)
		multi_data13 <= 17'b0 ;
	else
		multi_data13 <= delay_pipeline13*coeff13 ;
		
always@(posedge CLK or negedge RSTn) //x(1) * h(1)
	if(!RSTn)
		multi_data14 <= 17'b0 ;
	else
		multi_data14 <= delay_pipeline14*coeff14 ;
		
always@(posedge CLK or negedge RSTn) //x(1) * h(1)
	if(!RSTn)
		multi_data15 <= 17'b0 ;
	else
		multi_data15 <= delay_pipeline15*coeff15 ;
		
always@(posedge CLK or negedge RSTn) //x(1) * h(1)
	if(!RSTn)
		multi_data16 <= 17'b0 ;
	else
		multi_data16 <= delay_pipeline16*coeff16 ;
		
always@(posedge CLK or negedge RSTn) //x(1) * h(1)
	if(!RSTn)
		multi_data17 <= 17'b0 ;
	else
		multi_data17 <= delay_pipeline17*coeff17 ;
		
always@(posedge CLK or negedge RSTn) //x(1) * h(1)
	if(!RSTn)
		multi_data18 <= 17'b0 ;
	else
		multi_data18 <= delay_pipeline18*coeff18 ;
		
always@(posedge CLK or negedge RSTn) //x(1) * h(1)
	if(!RSTn)
		multi_data19 <= 17'b0 ;
	else
		multi_data19 <= delay_pipeline19*coeff19 ;
always@(posedge CLK or negedge RSTn) //x(0) * h(0)
	if(!RSTn)
		multi_data20 <= 17'b0 ;
	else
		multi_data20 <= delay_pipeline20*coeff20;
		
always@(posedge CLK or negedge RSTn) //x(1) * h(1)
	if(!RSTn)
		multi_data21 <= 17'b0 ;
	else
		multi_data21 <= delay_pipeline21*coeff21 ;

//=================================================================================
//这一级的主要功能是将乘积累加，累加的结果就是滤波后的信号。

always@(posedge CLK or negedge RSTn)
	if(!RSTn)
		FIR_OUT <= 16'b0 ;
	else
		FIR_OUT <= multi_data1 + multi_data2 + multi_data3 + multi_data4 +multi_data5 + multi_data6 + multi_data7 + multi_data8 + multi_data9 + multi_data10/
		+multi_data11 + multi_data12 + multi_data13 + multi_data14 +multi_data15 + multi_data16 + multi_data17 + multi_data18 + multi_data19 + multi_data20 + multi_data21;
		
endmodule