`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/16 12:28:10
// Design Name: 
// Module Name: reg_write_data_mux
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


module reg_write_data_mux(
    input memToReg,
    input [31:0] input1,
    input [31:0] input2,
    output reg [31:0] out
    );
    initial out=0;
    
    always @ (memToReg or input1 or input2)
    begin
        out=memToReg ? input1 : input2;
    end
    
endmodule
