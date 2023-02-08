`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:46:29 11/07/2021 
// Design Name: 
// Module Name:    rom_addr 
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
module rom_addr(    
    input clk,
    input rst_n,
    output reg[4 : 0] addra32
    );


always@(posedge clk or negedge rst_n)
begin
     if(rst_n == 0)
       begin
        addra32   <= 0;
       end
     else if(addra32 == 5'd31)
	  addra32 <= 0;
     else 
	  addra32   <= addra32 + 2;
end

endmodule
