`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/13 16:00:27
// Design Name: 
// Module Name: inst_mem
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


module inst_mem(
    input [31:0] pc,
    output reg [31:0] inst
    );
    
    reg [31:0] instReg[31:0];
    initial //$readmemb("E:/arhlabs/lab5/mem_inst.txt",instReg);
    begin
    $readmemb("G:/labs111/lab06/mem_inst.txt",instReg);
    inst=0;
    end
    
    always @ (pc)
    begin
        inst=instReg[pc>>2];
    end

    
    
endmodule
