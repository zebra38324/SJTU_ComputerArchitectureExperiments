`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/16 01:13:46
// Design Name: 
// Module Name: register
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


module register(
    input clk,
    input regWr,
    input [4:0] readAddr1,
    input [4:0] readAddr2,
    input [4:0] writeAddr,
    input [31:0] writeData,
    output reg [31:0] readData1,
    output reg [31:0] readData2
    );
    
    reg [31:0] regFile[31:0];
    
    initial begin
    $readmemb("G:/labs111/lab06/mem_reg.txt",regFile);
    readData1=0;
    readData2=0;
    end
    
    always @ (negedge clk)
    begin
        if(regWr)
            regFile[writeAddr]=writeData;
        #5
        readData1=regFile[readAddr1];
        readData2=regFile[readAddr2];
    end
    
    
endmodule
