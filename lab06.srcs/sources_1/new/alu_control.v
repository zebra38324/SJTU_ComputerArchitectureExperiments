`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/16 02:00:17
// Design Name: 
// Module Name: alu_control
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


module alu_control(
    input [5:0] func,
    input [1:0] aluOpEX,
    output reg [3:0] aluCtr
    );
    
    initial begin
        aluCtr=0;
    end
    
    always @ (func or aluOpEX)
    begin
        casex({aluOpEX,func})
            8'b00xxxxxx:aluCtr=4'b0010;
            8'bx1xxxxxx:aluCtr=4'b0110;
            8'b1xxx0000:aluCtr=4'b0010;
            8'b1xxx0010:aluCtr=4'b0110;
            8'b1xxx0100:aluCtr=4'b0000;
            8'b1xxx0101:aluCtr=4'b0001;
            8'b1xxx1010:aluCtr=4'b0111;
            8'b10100111:aluCtr=4'b1100;
        endcase
    end
    
endmodule
