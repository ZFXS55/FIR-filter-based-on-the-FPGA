`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:33:41 07/26/2021 
// Design Name: 
// Module Name:    rom_ctr 
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
module rom_ctr(
    input clk,
    input rst_n,
    output reg[5 : 0] addra64,
    output reg[6 : 0] addra128,
    output reg[8 : 0] addra512,
    output reg[10 : 0] addra2048,
    output reg[11 : 0] addra4096
    );
	 
	 
	 
reg[1:0] cnt;
//--------定个计时器--------//
always@(posedge clk or negedge rst_n)
begin
     if(rst_n == 0)
	  cnt <= 0;
	  else if (cnt == 2'd1)
	  cnt <= 0;
	  else
	  cnt <= cnt + 1;	  
end




always@(posedge clk or negedge rst_n)
begin
     if(rst_n == 0)
     begin
        addra64   <= 0;
        addra128  <= 0;
	  addra512  <= 0;
	  addra2048 <= 0;
	  addra4096 <= 0;
     end
        else if(addra64 == 6'd63)
	  addra64 <= 0;
        else if(addra128 == 7'd127)
	  addra128 <= 0;
	  else if(addra512 == 9'd511)
	  addra512 <= 0;
	  else if(addra2048 == 11'd2047)
	  addra2048 <= 0;
	  else if(addra4096 == 12'd4095)
	  addra4096 <= 0;
	   else if (cnt == 2'd1)
	  begin
	  addra64   <= addra64 + 1;
	  addra128  <= addra128 + 1;
	  addra512  <= addra512 + 1; 
	  addra2048 <= addra2048 + 1;
	  addra4096 <= addra4096 + 1;
	  end
	  else
	  begin
	  addra64   <= addra64;
	  addra128  <= addra128;
	  addra512  <= addra512 ;
	  addra2048 <= addra2048 ;
	  addra4096 <= addra4096 ;
	  end
end

endmodule