`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/13 16:53:25
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input reset
    );
    
    //前向通路模块提前定义
    wire [31:0] aluInput1,aluInput2Temp;
    wire [4:0] rsEX;
    wire [1:0] selAluInput1,selAluInput2;
    wire stallLoadUse;//1,stallLoadUse2;
    
    //IF
    wire branchRes,jumpRes,stall;//jump,branch的清除功能
    wire [31:0] branchPc,jumpPc,pcAdd4,inst,pc;
    
    //ID
    wire [31:0] pcAdd4ID,writeRegData,readRegData1,readRegData2,immExt;
    wire [5:0] ctr;
    wire [4:0] rs,rt,rd,writeRegAddr;
    wire [15:0] imm;
    wire regDst,jump,branch,memRead,memToReg,memWr,aluSrc,regWr;
    wire [1:0] aluOp;
    wire [25:0] immJump;
    wire [31:0] jumpPcID;
    wire [4:0] writeRegAddrWB;//提前声明 
    wire regWrWB;//提前声明
    
    //EX
    wire [31:0] pcAdd4EX,readRegData1EX,readRegData2EX,immExtEX;
    wire [4:0] rtEX,rdEX;
    wire [1:0] aluOpEX;
    wire regDstEX,jumpEX,branchEX,memReadEX,memToRegEX,memWrEX,aluSrcEX,regWrEX; 
    wire [31:0] branchPcEX,aluInput2,aluRes,jumpPcEX;
    wire [3:0] aluCtr;
    wire zero;
    wire [4:0] writeRegAddrEX;
    
    //MEM
    wire [31:0] readRegData2MEM,aluResMEM;
    wire branchMEM,memReadMEM,memToRegMEM,memWrMEM,regWrMEM,zeroMEM;
    wire [4:0] writeRegAddrMEM;
    wire [31:0] readMemData;
    
    //WB
    wire [31:0] readMemDataWB,aluResWB;
    wire memToRegWB;//regWrWB之前已经声明
    //writeRegAddrWB之前已经声明
    
    inst_mem if0 (
        .pc(pc),.inst(inst));
    pc_add_4 if1 (
        .pc(pc),.pcAdd4(pcAdd4));
    mux_pc if2 (
        .clk(clk),.stallLoadUse(stallLoadUse),.branchRes(branchRes),.branchPc(branchPc),.jumpRes(jumpRes),.jumpPc(jumpPc),
        .pcAdd4(pcAdd4),.pc(pc),.stall(stall));
    
    
    IF_ID if_id (
        .clk(clk),.reset(reset),.stall(stall),.stallLoadUse(stallLoadUse),.pcAdd4(pcAdd4),.inst(inst),
        .pcAdd4ID(pcAdd4ID),.ctr(ctr),.rs(rs),.rt(rt),.rd(rd),.imm(imm),.immJump(immJump));
    control id0 (reset,stall,ctr,regDst,jump,branch,memRead,memToReg,aluOp,memWr,aluSrc,regWr);
    //regWr可能需要调整
    register id1(clk,regWrWB,rs,rt,writeRegAddrWB,writeRegData,readRegData1,readRegData2);
    sign_extend id2(imm,immExt);
    jump_add id3(immJump,pcAdd4ID,jumpPcID);
    forward_stall id4 (rs,rt,writeRegAddrEX,regWrEX,memToRegEX,stallLoadUse);
    
    
    ID_EX id_ex (clk,reset,stall,stallLoadUse,regDst,jump,branch,memRead,memToReg,aluOp,memWr,aluSrc,regWr,pcAdd4ID,readRegData1,readRegData2,immExt,rs,rt,rd,jumpPcID,
        regDstEX,jumpEX,branchEX,memReadEX,memToRegEX,aluOpEX,memWrEX,aluSrcEX,regWrEX,pcAdd4EX,readRegData1EX,readRegData2EX,immExtEX,rsEX,rtEX,rdEX,jumpPcEX);
    branch_add ex0 (pcAdd4EX,immExtEX,branchPcEX);
    alu_control ex1 (immExtEX[5:0],aluOpEX,aluCtr);
    mux_alu ex2 (aluSrcEX,immExtEX,aluInput2Temp,aluInput2);
    alu ex3 (aluInput1,aluInput2,aluCtr,zero,aluRes);
    reg_mux ex4 (regDstEX,rdEX,rtEX,writeRegAddrEX);
    mux_alu_input1 ex5 (readRegData1EX,writeRegData,aluResMEM,selAluInput1,aluInput1);
    mux_alu_input2 ex6 (readRegData2EX,writeRegData,aluResMEM,selAluInput2,aluInput2Temp);
    //id_ex中添加rs,增加stallLoadUse功能
    forward_unit ex7 (rsEX,rtEX,writeRegAddrMEM,regWrMEM,memToRegMEM,
        writeRegAddrWB,regWrWB,memToRegWB,selAluInput1,selAluInput2);
    
    
    
    EX_MEM ex_mem (clk,reset,stall,stallLoadUse,jumpEX,branchEX,memReadEX,memToRegEX,memWrEX,regWrEX,zero,branchPcEX,aluRes,readRegData2EX,writeRegAddrEX,jumpPcEX,
        jumpRes,branchMEM,memReadMEM,memToRegMEM,memWrMEM,regWrMEM,zeroMEM,branchPc,aluResMEM,readRegData2MEM,writeRegAddrMEM,jumpPc);
    branch_and mem0 (branchMEM,zeroMEM,branchRes);
    data_memory mem1 (clk,memReadMEM,memWrMEM,aluResMEM,readRegData2MEM,readMemData);
    
    
    MEM_WB mem_wb (clk,reset,stall,memToRegMEM,regWrMEM,readMemData,aluResMEM,writeRegAddrMEM,
        memToRegWB,regWrWB,readMemDataWB,aluResWB,writeRegAddrWB);
    reg_write_data_mux wb0 (memToRegWB,readMemDataWB,aluResWB,writeRegData);

    
endmodule
