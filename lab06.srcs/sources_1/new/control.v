`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/16 00:48:37
// Design Name: 
// Module Name: control
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


module control(
    input reset,
    input stall,
    input [5:0] ctr,
    output reg regDst,
    output reg jump,
    output reg branch,
    output reg memRead,
    output reg memToReg,
    output reg [1:0] aluOp,
    output reg memWr,
    output reg aluSrc,
    output reg regWr
    );
    initial
    begin
            regDst=0;
            jump=0;
            branch=0;
            memRead=0;
            memToReg=0;
            aluOp=2'b00;
            memWr=0;
            aluSrc=0;
            regWr=0;
    end
    
    always @ (ctr)
    begin
        if(stall==0 && reset==1)
        begin
        case(ctr)
        6'b000000:
        begin
            regDst=1;
            jump=0;
            branch=0;
            memRead=0;
            memToReg=0;
            aluOp=2'b10;
            memWr=0;
            aluSrc=0;
            regWr=1;
        end
        
        6'b100011:
        begin
            regDst=0;
            jump=0;
            branch=0;
            memRead=1;
            memToReg=1;
            aluOp=2'b00;
            memWr=0;
            aluSrc=1;
            regWr=1;
        end
        
        6'b101011:
        begin
            regDst=0;
            jump=0;
            branch=0;
            memRead=0;
            memToReg=0;
            aluOp=2'b00;
            memWr=1;
            aluSrc=1;
            regWr=0;
        end
        
        6'b000100:
        begin
            regDst=0;
            jump=0;
            branch=1;
            memRead=0;
            memToReg=0;
            aluOp=2'b01;
            memWr=0;
            aluSrc=0;
            regWr=0;
        end
        
        6'b000010:
        begin
            regDst=0;
            jump=1;
            branch=0;
            memRead=0;
            memToReg=0;
            aluOp=2'b00;
            memWr=0;
            aluSrc=0;
            regWr=0;
        end
        endcase
        end
        else
        begin
            regDst=0;
            jump=0;
            branch=0;
            memRead=0;
            memToReg=0;
            aluOp=2'b00;
            memWr=0;
            aluSrc=0;
            regWr=0;
        end  
    end
    
    
endmodule
