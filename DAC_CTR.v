`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:23:31 09/05/2021 
// Design Name: 
// Module Name:    DAC_CTR 
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
module dac_ctrl(
    input clk,
    input rst_n,
    input  [7:0] da_data,
    output [7:0] da_pre_data,
    output clk_dac
    );
assign clk_dac = clk ;


reg [7:0] cach;
always@(posedge clk or negedge rst_n)
begin
     if(rst_n == 0)
	  cach <= 0;
	  else
	  cach <= da_data[7:0];
end




 assign da_pre_data = cach;
endmodule

