`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/16 13:47:48
// Design Name: 
// Module Name: jump_add
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


module jump_add(
    input [25:0] immJump,
    input [31:0] pcAdd4ID,
    output reg [31:0] jumpPcID
    );
    reg [27:0] temp;
    initial jumpPcID=0;
    
    always @ (immJump or pcAdd4ID)
    begin
        temp=immJump<<2;
        jumpPcID={pcAdd4ID[31:28],temp[27:0]};
    end
    
endmodule
