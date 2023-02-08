`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:01:20 11/04/2021 
// Design Name: 
// Module Name:    AD 
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
module adc_ctrl(
     input  clk,
     input  rst_n,
     input  [7:0]ad_data,
     output [7:0]ad_pre_data,
     output clk_adc
   );

assign clk_adc = clk;
reg [7:0] cach;
always@(posedge clk or negedge rst_n)
begin
     if(rst_n == 0)
	  cach <= 0;
	  else
	  cach <= ad_data[7:0];
end




 assign ad_pre_data = cach;
endmodule




