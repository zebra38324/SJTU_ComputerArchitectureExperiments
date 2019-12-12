`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/16 18:59:53
// Design Name: 
// Module Name: top_tb
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


module top_tb(

    );
    
    reg clk;
    reg reset;
    
    top u0(
        .clk(clk),
        .reset(reset)
        
    );
    
    always begin
        clk=0;
        #10;
        clk=1;
        #10;
    end
    
    initial
    begin
        reset=1;
    
    end

    
    
    
endmodule
