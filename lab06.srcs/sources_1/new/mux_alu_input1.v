`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/17 00:56:48
// Design Name: 
// Module Name: mux_alu_input1
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


module mux_alu_input1(
    input [31:0] input1,
    input [31:0] input2,
    input [31:0] input3,
    input [1:0] sel,
    output reg [31:0] aluInput1
    );
    initial aluInput1=0;
    
    always @ (input1 or input2 or input3 or sel)
    begin
        case(sel)
        2'b00:aluInput1=input1;
        2'b01:aluInput1=input2;
        2'b10:aluInput1=input3;
        2'b11:aluInput1=0;
        endcase
    end
    
endmodule
