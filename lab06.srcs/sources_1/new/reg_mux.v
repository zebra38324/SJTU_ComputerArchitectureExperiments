`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/16 11:23:08
// Design Name: 
// Module Name: reg_mux
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


module reg_mux(
    input regDst,
    input [4:0] input1,
    input [4:0] input2,
    output reg [4:0] out
    );
    initial out=0;
    
    always @ (regDst or input1 or input2)
    begin
        out=regDst?input1:input2;
    end
    
endmodule
