`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/16 01:35:13
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(
    input clk,
    input reset,
    input stall,
    input stallLoadUse,
    input regDst,
    input jump,
    input branch,
    input memRead,
    input memToReg,
    input [1:0] aluOp,
    input memWr,
    input aluSrc,
    input regWr,
    input [31:0] pcAdd4ID,
    input [31:0] readRegData1,
    input [31:0] readRegData2,
    input [31:0] immExt,
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] rd,
    input [31:0] jumpPcID,
    output reg regDstEX,
    output reg jumpEX,
    output reg branchEX,
    output reg memReadEX,
    output reg memToRegEX,
    output reg [1:0] aluOpEX,
    output reg memWrEX,
    output reg aluSrcEX,
    output reg regWrEX,
    output reg [31:0] pcAdd4EX,
    output reg [31:0] readRegData1EX,
    output reg [31:0] readRegData2EX,
    output reg [31:0] immExtEX,
    output reg [4:0] rsEX,
    output reg [4:0] rtEX,
    output reg [4:0] rdEX,
    output reg [31:0] jumpPcEX
    );
    
    initial
    begin
        regDstEX<=0;
        jumpEX<=0;
        branchEX<=0;
        memReadEX<=0;
        memToRegEX<=0;
        aluOpEX<=0;
        memWrEX<=0;
        aluSrcEX<=0;
        regWrEX<=0;
        pcAdd4EX<=0;
        readRegData1EX<=0;
        readRegData2EX<=0;
        immExtEX<=0;
        rsEX<=0;
        rtEX<=0;
        rdEX<=0;
        jumpPcEX<=0;
    end
    
    always @ (posedge clk)
    begin
        if(!stallLoadUse)
        begin
        regDstEX<=regDst;
        jumpEX<=jump;
        branchEX<=branch;
        memReadEX<=memRead;
        memToRegEX<=memToReg;
        aluOpEX<=aluOp;
        memWrEX<=memWr;
        aluSrcEX<=aluSrc;
        regWrEX<=regWr;
        pcAdd4EX<=pcAdd4ID;
        readRegData1EX<=readRegData1;
        readRegData2EX<=readRegData2;
        immExtEX<=immExt;
        rsEX<=rs;
        rtEX<=rt;
        rdEX<=rd;
        jumpPcEX<=jumpPcID;
        end
        else
        begin
        regDstEX<=0;
        jumpEX<=0;
        branchEX<=0;
        memReadEX<=0;
        memToRegEX<=0;
        aluOpEX<=0;
        memWrEX<=0;
        aluSrcEX<=0;
        regWrEX<=0;
        pcAdd4EX<=0;
        readRegData1EX<=0;
        readRegData2EX<=0;
        immExtEX<=0;
        rsEX<=0;
        rtEX<=0;
        rdEX<=0;
        jumpPcEX<=0;
        end
        
    end
    
    always @ (reset or stall)
    begin
        if(reset==0 || stall==1)
        begin
        regDstEX<=0;
        jumpEX<=0;
        branchEX<=0;
        memReadEX<=0;
        memToRegEX<=0;
        aluOpEX<=0;
        memWrEX<=0;
        aluSrcEX<=0;
        regWrEX<=0;
        pcAdd4EX<=0;
        readRegData1EX<=0;
        readRegData2EX<=0;
        immExtEX<=0;
        rsEX<=0;
        rtEX<=0;
        rdEX<=0;
        jumpPcEX<=0;
        end
    end
    
endmodule
