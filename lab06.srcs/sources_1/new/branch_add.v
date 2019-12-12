`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/16 01:52:58
// Design Name: 
// Module Name: branch_add
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module branch_add(
    input [31:0] pcAdd4EX,
    input [31:0] immExtEX,
    output reg [31:0] branchPcEX
    );
    
    initial branchPcEX=0;
    
    always @ (pcAdd4EX or immExtEX)
    begin
        branchPcEX=pcAdd4EX+(immExtEX*4);
    end
    
endmodule
