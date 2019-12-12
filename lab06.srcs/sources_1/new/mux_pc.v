`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/13 16:17:22
// Design Name: 
// Module Name: mux_pc
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


module mux_pc(
    input clk,
    input stallLoadUse,
    input branchRes,
    input [31:0] branchPc,
    input jumpRes,
    input [31:0] jumpPc,
    input [31:0] pcAdd4,
    output reg [31:0] pc,
    output reg stall
    );
    
    initial begin
        pc<=0;
        stall<=0;
    end
    
    always @ (posedge clk)
    begin
        if(!stallLoadUse)
        begin
        if(branchRes)
        begin
            pc<=branchPc;
            stall<=1;
        end
        else if(jumpRes)
        begin
            pc<=jumpPc;
            stall<=1;
        end
        else
        begin
            pc<=pcAdd4;
            stall<=0;
        end
        end
    end
    
    
endmodule
