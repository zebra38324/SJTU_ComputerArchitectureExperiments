`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/15 12:35:18
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(
    input clk,
    input reset,
    input stall,
    input stallLoadUse,
    input [31:0] pcAdd4,
    input [31:0] inst,
    output reg [31:0] pcAdd4ID,
    output reg [5:0] ctr,
    output reg [4:0] rs,
    output reg [4:0] rt,
    output reg [4:0] rd,
    output reg [15:0] imm,
    output reg [25:0] immJump
    );
    
    initial
    begin
            pcAdd4ID<=0;
            ctr<=0;
            rs<=0;
            rt<=0;
            rd<=0;
            imm<=0;
            immJump<=0;
    end
    
    always @ (posedge clk)
    begin
        if(!stallLoadUse)
        begin
        pcAdd4ID<=pcAdd4;
        ctr<=inst[31:26];
        rs<=inst[25:21];
        rt<=inst[20:16];
        rd<=inst[15:11];
        imm<=inst[15:0];
        immJump<=inst[25:0];
        end
    end
    
    always @ (reset or stall)
    begin
        if(reset==0||stall==1)
        begin
            pcAdd4ID<=0;
            ctr<=0;
            rs<=0;
            rt<=0;
            rd<=0;
            imm<=0;
            immJump<=0;
        end
    end
    
    
endmodule
