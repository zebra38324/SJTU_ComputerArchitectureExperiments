`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/16 12:17:19
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(
    input clk,
    input reset,
    input stall,
    input memToRegMEM,
    input regWrMEM,
    input [31:0] readMemData,
    input [31:0] aluResMEM,
    input [4:0] writeRegAddrMEM,
    output reg memToRegWB,
    output reg regWrWB,
    output reg [31:0] readMemDataWB,
    output reg [31:0] aluResWB,
    output reg [4:0] writeRegAddrWB
    );
    
    initial 
    begin
        memToRegWB<=0;
        regWrWB<=0;
        readMemDataWB<=0;
        aluResWB<=0;
        writeRegAddrWB<=0;
    end
    
    always @ (posedge clk)
    begin
        memToRegWB<=memToRegMEM;
        regWrWB<=regWrMEM;
        readMemDataWB<=readMemData;
        aluResWB<=aluResMEM;
        writeRegAddrWB<=writeRegAddrMEM;
    end
    
    always @ (reset or stall)
    begin
        if(reset==0 || stall==1)
        begin
            memToRegWB<=0;
            regWrWB<=0;
            readMemDataWB<=0;
            aluResWB<=0;
            writeRegAddrWB<=0;
        end
    end
    
endmodule
