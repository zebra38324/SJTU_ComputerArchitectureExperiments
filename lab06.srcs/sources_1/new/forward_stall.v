`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/17 15:48:05
// Design Name: 
// Module Name: forward_stall
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


module forward_stall(
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] rdEX,
    input regWrEX,
    input memToRegEX,
    output reg stallLoadUse
    );
    
    initial stallLoadUse=0;
    
    always @ (rs or rt or rdEX or regWrEX or memToRegEX)
    begin
        if((rs==rdEX || rt==rdEX) && regWrEX && memToRegEX)
        begin
            stallLoadUse=1;
        end
        else
        begin
            stallLoadUse=0;
        end
    end
    
    
endmodule
