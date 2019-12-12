`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/16 02:13:04
// Design Name: 
// Module Name: mux_alu
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


module mux_alu(
    input aluSrcEX,
    input [31:0] input1,
    input [31:0] input2,
    output reg [31:0] aluInput2
    );
    initial aluInput2=0;
    
    always @ (aluSrcEX or input1 or input2)
    begin
        aluInput2=aluSrcEX ? input1:input2;
    end
    
endmodule
