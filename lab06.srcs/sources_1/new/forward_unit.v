`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/17 00:56:48
// Design Name: 
// Module Name: forward_unit
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


module forward_unit(
    input [4:0] rsEX,
    input [4:0] rtEX,
    input [4:0] rdMEM,
    input regWrMEM,
    input memToRegMEM,
    input [4:0] rdWB,
    input regWrWB,
    input memToRegWB,
    output reg [1:0] selAluInput1,
    output reg [1:0] selAluInput2
    );
    
    initial begin
    selAluInput1=2'b00;
    selAluInput2=2'b00;
    end
    
    reg stallLoadUse1;
    reg stallLoadUse2;
    
    always @ (rsEX or rtEX or rdMEM or regWrMEM or memToRegMEM
         or rdWB or regWrWB or memToRegWB)
    begin
        if(rsEX==rdWB)
        begin
            if(memToRegWB && regWrWB)
            begin
                selAluInput1=2'b01;
                stallLoadUse1=0;
            end
            else if(!memToRegWB && regWrWB)
            begin
                selAluInput1=2'b01;
                stallLoadUse1=0;
            end
            else
            begin
                selAluInput1=2'b00;
                stallLoadUse1=0;
            end
        end
        else if(rsEX==rdMEM)
        begin
            if(memToRegMEM && regWrMEM)//load-use³åÍ»
            begin
                selAluInput1=2'b11;
                stallLoadUse1=1;
            end
            else if(!memToRegMEM && regWrMEM)
            begin
                selAluInput1=2'b10;
                stallLoadUse1=0;
            end
            else
            begin
                selAluInput1=2'b00;
                stallLoadUse1=0;
            end
        end 
        else
        begin
            selAluInput1=2'b00;
            stallLoadUse1=0;
        end
        //
        
        if(rtEX==rdWB)
        begin
            if(memToRegWB && regWrWB)
            begin
                selAluInput2=2'b01;
                stallLoadUse2=0;
            end
            else if(!memToRegWB && regWrWB)
            begin
                selAluInput2=2'b01;
                stallLoadUse2=0;
            end
            else
            begin
                selAluInput2=2'b00;
                stallLoadUse2=0;
            end
        end
        else if(rtEX==rdMEM)
        begin
            if(memToRegMEM && regWrMEM)//load-use³åÍ»
            begin
                selAluInput2=2'b11;
                stallLoadUse2=1;
            end
            else if(!memToRegMEM && regWrMEM)
            begin
                selAluInput2=2'b10;
                stallLoadUse2=0;
            end
            else
            begin
                selAluInput2=2'b00;
                stallLoadUse2=0;
            end
        end
        else
        begin
            selAluInput2=2'b00;
            stallLoadUse2=0;
        end
    end
    
endmodule
