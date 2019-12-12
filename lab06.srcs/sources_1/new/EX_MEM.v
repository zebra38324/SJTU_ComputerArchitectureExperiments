`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/16 11:38:29
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(
    input clk,
    input reset,
    input stall,
    input stallLoadUse,
    input jumpEX,
    input branchEX,
    input memReadEX,
    input memToRegEX,
    input memWrEX,
    input regWrEX,
    input zero,
    input [31:0] branchPcEX,
    input [31:0] aluRes,
    input [31:0] readRegData2EX,
    input [4:0] writeRegAddrEX,
    input [31:0] jumpPcEX,
    output reg jumpMEM,
    output reg branchMEM,
    output reg memReadMEM,
    output reg memToRegMEM,
    output reg memWrMEM,
    output reg regWrMEM,
    output reg zeroMEM,
    output reg [31:0] branchPcMEM,
    output reg [31:0] aluResMEM,
    output reg [31:0] readRegData2MEM,
    output reg [4:0] writeRegAddrMEM,
    output reg [31:0] jumpPc
    );
    
    initial 
    begin
            jumpMEM<=0;
            branchMEM<=0;
            memReadMEM<=0;
            memToRegMEM<=0;
            memWrMEM<=0;
            regWrMEM<=0;
            zeroMEM<=0;
            branchPcMEM<=0;
            aluResMEM<=0;
            readRegData2MEM<=0;
            writeRegAddrMEM<=0;
            jumpPc<=0;
        end
    
    always @ (posedge clk)
    begin
        jumpMEM<=jumpEX;
        branchMEM<=branchEX;
        memReadMEM<=memReadEX;
        memToRegMEM<=memToRegEX;
        memWrMEM<=memWrEX;
        regWrMEM<=regWrEX;
        zeroMEM<=zero;
        branchPcMEM<=branchPcEX;
        aluResMEM<=aluRes;
        readRegData2MEM<=readRegData2EX;
        writeRegAddrMEM<=writeRegAddrEX;
        jumpPc<=jumpPcEX;
    end
    
    always @ (reset or stall)
    begin
        if(reset==0 || stall==1)
        begin
            jumpMEM<=0;
            branchMEM<=0;
            memReadMEM<=0;
            memToRegMEM<=0;
            memWrMEM<=0;
            regWrMEM<=0;
            zeroMEM<=0;
            branchPcMEM<=0;
            aluResMEM<=0;
            readRegData2MEM<=0;
            writeRegAddrMEM<=0;
            jumpPc<=0;
        end
    end
    
    
endmodule
