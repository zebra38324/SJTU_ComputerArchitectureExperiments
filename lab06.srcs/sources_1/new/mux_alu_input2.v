`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/17 00:56:48
// Design Name: 
// Module Name: mux_alu_input2
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


module mux_alu_input2(
    input [31:0] input1,
    input [31:0] input2,
    input [31:0] input3,
    input sel,
    output reg [31:0] aluInput2
    );
    initial aluInput2=0;
    
    always @ (input1 or input2 or input3 or sel)
    begin
        case(sel)
        2'b00:aluInput2=input1;
        2'b01:aluInput2=input2;
        2'b10:aluInput2=input3;
        2'b11:aluInput2=0;
        endcase
    end
endmodule
