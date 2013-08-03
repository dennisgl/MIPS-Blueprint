//	Title: MIPS Single-Cycle Processor
//	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
module mips_single( clk, rst );
	input clk, rst;
	
	// right_instr_from_IFID_to_IDEXuction bus
	wire[31:0] right_instr_from_IFID_to_IDEX, right_instr_from_IFID_to_IDEX_to_IFID;
	
	// break out important fields from right_instr_from_IFID_to_IDEXuction
	wire [5:0] opcode, funct;
    wire [4:0] rs, rt, rt_from_IDEX_to_EXMEM, rd, rd_from_IDEX_to_EXMEM, shamt;
    wire [15:0] immed;
    wire [31:0] extend_immed, extend_immed_from_IDEX_to_EXMEM, b_offset;
    wire [25:0] jumpoffset, jumpoffset_to_IFID;
	
	// datapath signals
    wire [4:0] rfile_wn, rfile_wn_from_EXMEM_to_MEMWB, rfile_wn_from_MEMWB ;
    wire [31:0] rfile_rd1, rfile_rd1_from_IDEX_to_EXMEM, rfile_rd2, rfile_rd2_from_IDEX_to_EXMEM, rfile_rd2_from_EXMEM_to_MEMWB, WRMUX_out, rfile_wd, alu_b, alu_out, alu_out_from_EXMEM_to_MEMWB, alu_out_from_MEMWB, b_tgt, b_tgt_from_EXMEM_to_MEMWB, pc_next,
                pc, pc_incr_to_IFID, pc_incr_form_IFID_to_IDEX, pc_incr_form_IDEX_to_EXMEM, dmem_rdata, dmem_rdata_from_MEMWB, jump_addr, jump_addr_from_IDEX_to_EXMEM, jump_addr_from_EXMEM_to_MEMWB, branch_addr;

	// control signals
    wire RegWrite, Branch, PCSrc, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, Zero, zero_from_EXMEM_to_MEMWB, Jump;
    wire [1:0] ALUOp;
    wire [2:0] Operation;
	
	// student add control wire
	wire ControlToIDEX_RegWrite, ControlToIDEX_MemtoReg, ControlToIDEX_MemRead, ControlToIDEX_MemWrite, ControlToIDEX_Branch, ControlToIDEX_Jump ;
    wire ControlToIDEX_RegDst  ;
    wire [1:0]ControlToIDEX_ALUOp;
	wire ControlToIDEX_ALUSrc, ControlToIDEX_BneDst ;
    
	
    wire IDEXtoEXMEM_RegWrite, 	IDEXtoEXMEM_MemtoReg, IDEXtoEXMEM_MemRead, IDEXtoEXMEM_MemWrite, IDEXtoEXMEM_Branch;
	wire IDEXtoEXMEM_Jump ;
	
	wire EXMEMtoMEMWB_RegWrite, EXMEMtoMEMWB_MemtoReg ;
	
	// diuv use
	wire [63:0] multi_dataout, divu_data_out_from_EXMEM_to_MEMWB ;
	wire [31:0] HiOut, LoOut ;
	
	// shifter use
	wire [31:0] shamt_32bits, shamt_32bits_from_IDEX_to_EXMEM , shifter_dataout, shifter_dataout_from_EXMEM_to_MEMWB, shifter_dataout_from_MEMWB ;
	
	
	// student add "andi, divu, bne"
	wire ExtndDst, BneDst, ZeroSrc ;
	
	
	
    assign opcode = right_instr_from_IFID_to_IDEX[31:26];
    assign rs = right_instr_from_IFID_to_IDEX[25:21];
    assign rt = right_instr_from_IFID_to_IDEX[20:16];
    assign rd = right_instr_from_IFID_to_IDEX[15:11];
    assign shamt = right_instr_from_IFID_to_IDEX[10:6];
	assign shamt_32bits = { 27'b000_0000_0000_0000_0000_0000_0000, shamt } ;
	
    assign immed = right_instr_from_IFID_to_IDEX[15:0];
    assign jumpoffset = right_instr_from_IFID_to_IDEX_to_IFID[25:0];
	
	// branch offset shifter
    assign b_offset = extend_immed_from_IDEX_to_EXMEM << 2;
	
	// jump offset shifter & concatenation
	assign jump_addr = { pc_incr_form_IFID_to_IDEX[31:28], jumpoffset_to_IFID <<2 };

	// module instantiations
	
	reg32 PC( .clk(clk), .rst(rst), .en_reg(1'b1), .d_in(pc_next), .d_out(pc) );
	// sign-extender
	sign_extend SignExt( .immed_in(immed), .ext_immed_out(extend_immed), .extndDecide(ExtndDst)  );
	
	add32 PCADD( .a(pc), .b(32'd4), .result(pc_incr_to_IFID) );

	
	
	// if_id
	if_id if_id_complement(  .clk(clk), .rst(rst), .en_reg(1'b1), .add32_in(pc_incr_to_IFID), .add32_out(pc_incr_form_IFID_to_IDEX), 
	                         .insmem_in(right_instr_from_IFID_to_IDEX_to_IFID), .insmem_out(right_instr_from_IFID_to_IDEX) , .jmpaddr_in(jumpoffset), .jmpaddr_out(jumpoffset_to_IFID));
	
	// id_ex
	id_ex id_ex_complement(  .clk(clk), .rst(rst), .en_reg(1'b1), .add32_tin(pc_incr_form_IFID_to_IDEX), .add32_tout(pc_incr_form_IDEX_to_EXMEM),
	                         .rfrd_out1( rfile_rd1_from_IDEX_to_EXMEM ), .rfrd_out2( rfile_rd2_from_IDEX_to_EXMEM ), .rfrd_in1(rfile_rd1), 
							 .rfrd_in2(rfile_rd2), .extnd_out( extend_immed_from_IDEX_to_EXMEM ), .extnd_in(extend_immed), .rt_in(rt), .rd_in(rd),
							 .rt_out(rt_from_IDEX_to_EXMEM), .rd_out(rd_from_IDEX_to_EXMEM ),
							
							 .RegDst_in(ControlToIDEX_RegDst), .ALUSrc_in(ControlToIDEX_ALUSrc), .MemtoReg_in(ControlToIDEX_MemtoReg), 
							 .RegWrite_in(ControlToIDEX_RegWrite), .MemRead_in(ControlToIDEX_MemRead), .MemWrite_in(ControlToIDEX_MemWrite),
							 .Branch_in(ControlToIDEX_Branch), .BneDst_in(ControlToIDEX_BneDst), .ALUOp_in(ControlToIDEX_ALUOp), .funct_in(right_instr_from_IFID_to_IDEX[5:0]),
							 .RegDst_out(RegDst), .ALUSrc_out(ALUSrc), .MemtoReg_out(IDEXtoEXMEM_MemtoReg), 
							 .RegWrite_out(IDEXtoEXMEM_RegWrite), .MemRead_out(IDEXtoEXMEM_MemRead), .MemWrite_out(IDEXtoEXMEM_MemWrite),
							 .Branch_out(IDEXtoEXMEM_Branch), .BneDst_out(BneDst), .ALUOp_out(ALUOp), .funct_out(funct), .Jump_in(ControlToIDEX_Jump), .Jump_out( IDEXtoEXMEM_Jump ),
							 .jmpaddr_in(jump_addr), .jmpaddr_out(jump_addr_from_IDEX_to_EXMEM) , .shamt_32bits_in(shamt_32bits), .shamt_32bits_out(shamt_32bits_from_IDEX_to_EXMEM) );	            
	// ex_mem
	ex_mem ex_mem_complement(  .clk(clk), .rst(rst), .en_reg(1'b1), .add32three_in(b_tgt), .add32three_out( b_tgt_from_EXMEM_to_MEMWB ),
							   .zero_in(ZeroSrc), .zero_out(zero_from_EXMEM_to_MEMWB), .alu_in(alu_out),
							   .alu_out( alu_out_from_EXMEM_to_MEMWB ), .EMrd_out2( rfile_rd2_from_EXMEM_to_MEMWB ),
							   .EMrd_in2( rfile_rd2_from_IDEX_to_EXMEM ), .rfile_wn_in( rfile_wn), .rfile_wn_out( rfile_wn_from_EXMEM_to_MEMWB),
							   
							   .in_shiftCtl(srlDst_toEXMEM), .out_shiftCtl(EXMEMtoMEMWB_srlDst),
							   .in_wb_regwrite(IDEXtoEXMEM_RegWrite), .in_wb_memtoreg(IDEXtoEXMEM_MemtoReg), .in_m_branch(IDEXtoEXMEM_Branch),
							   .in_m_memread(IDEXtoEXMEM_MemRead), .in_m_mem(IDEXtoEXMEM_MemWrite),
							   .out_wb_regwrite(EXMEMtoMEMWB_RegWrite), .out_wb_memtoreg(EXMEMtoMEMWB_MemtoReg), .out_m_branch(Branch), .Jump_in( IDEXtoEXMEM_Jump ), .Jump_out( Jump ),
							   .out_m_memread(MemRead), .out_m_mem(MemWrite), .jmpaddr_in(jump_addr_from_IDEX_to_EXMEM), .jmpaddr_out(jump_addr_from_EXMEM_to_MEMWB), .multi_data_in(multi_dataout), .multi_data_out(divu_data_out_from_EXMEM_to_MEMWB),
                               .shifter_dataout_in(shifter_dataout), .shifter_dataout_out(shifter_dataout_from_EXMEM_to_MEMWB)  );
	// mem_wb
	mem_wb mem_wb_complement(  .clk(clk), .rst(rst), .en_reg(1'b1), .alutwo_in( alu_out_from_EXMEM_to_MEMWB ),       
							  .alutwo_out( alu_out_from_MEMWB ) , .DataMemoryRd_out( dmem_rdata_from_MEMWB ),        
							  .DataMemoryRd_in( dmem_rdata ),.rfile_wn_in( rfile_wn_from_EXMEM_to_MEMWB),            
							  .rfile_wn_out( rfile_wn_from_MEMWB ) ,   

                              .in_shiftCtl(EXMEMtoMEMWB_srlDst), .out_shiftCtl(shiftDst), 
							  .MW_MemtoReg_in(EXMEMtoMEMWB_MemtoReg), .MW_RegWrite_in(EXMEMtoMEMWB_RegWrite),        
	                          .MW_MemtoReg_out(MemtoReg), .MW_RegWrite_out(RegWrite), .shifter_dataout_in(shifter_dataout_from_EXMEM_to_MEMWB), .shifter_dataout_out(shifter_dataout_from_MEMWB) );                              
                                                                                                                     
	                                                                                                                 
    add32 BRADD( .a(pc_incr_form_IDEX_to_EXMEM), .b(b_offset), .result(b_tgt) );                                     
                                                                                                                     
    alu ALU( .ctl(Operation), .a(rfile_rd1_from_IDEX_to_EXMEM), .b(alu_b), .result(alu_out), .zero(Zero) );          
                                                                                                                     
    and BR_AND(PCSrc, Branch, zero_from_EXMEM_to_MEMWB);                                                             
                                                                                                                     
    mux2 #(32) SHIFTER_MUX( .sel(shiftDst), .a(WRMUX_out), .b(shifter_dataout_from_MEMWB), .y(rfile_wd) ) ;	 
	 
	mux2 #(1) BENMUX( .sel(BneDst), .a(Zero), .b(~Zero), .y(ZeroSrc) ) ;
	  
    mux2 #(5) RFMUX( .sel(RegDst), .a(rt_from_IDEX_to_EXMEM), .b(rd_from_IDEX_to_EXMEM), .y(rfile_wn) );
      
    mux2 #(32) PCMUX( .sel(PCSrc), .a(pc_incr_to_IFID), .b(b_tgt_from_EXMEM_to_MEMWB), .y(branch_addr) );
	
	mux2 #(32) JMUX( .sel(Jump), .a(branch_addr), .b(jump_addr_from_EXMEM_to_MEMWB), .y(pc_next) );
	
    mux2 #(32) ALUMUX( .sel(ALUSrc), .a(rfile_rd2_from_IDEX_to_EXMEM), .b(extend_immed_from_IDEX_to_EXMEM), .y(alu_b) );

    mux2 #(32) WRMUX( .sel(MemtoReg), .a(alu_out), .b(dmem_rdata_from_MEMWB), .y(WRMUX_out) );

    control_single CTL(.opcode(opcode), .RegDst(ControlToIDEX_RegDst), .ALUSrc(ControlToIDEX_ALUSrc), .MemtoReg(ControlToIDEX_MemtoReg), 
                       .RegWrite(ControlToIDEX_RegWrite), .MemRead(ControlToIDEX_MemRead), .MemWrite(ControlToIDEX_MemWrite), .Branch(ControlToIDEX_Branch), 
                       .Jump(ControlToIDEX_Jump), .ALUOp(ControlToIDEX_ALUOp), .BneDst(ControlToIDEX_BneDst), .ExtndDst(ExtndDst) );

    
	wire [5:0] multiOperation ;
	wire [5:0] srlOperation ;
	//wire srlDst_toEXMEM ;
    alu_ctl ALUCTL( .clk(clk), .ALUOp(ALUOp), .Funct(funct), .ALUOperation(Operation), .multCtl(multiOperation), .shiftLeftCtl(srlOperation), .sllMuxDst(srlDst_toEXMEM));
	

	reg_file RegFile( .clk(clk), .RegWrite(RegWrite), .RN1(rs), .RN2(rt), .WN(rfile_wn_from_MEMWB), 
					  .WD(rfile_wd), .RD1(rfile_rd1), .RD2(rfile_rd2) );

	memory InstrMem( .clk(clk), .MemRead(1'b1), .MemWrite(1'b0), .wd(32'd0), .addr(pc), .rd(right_instr_from_IFID_to_IDEX_to_IFID) );

	memory DatMem( .clk(clk), .MemRead(MemRead), .MemWrite(MemWrite), .wd(rfile_rd2_from_EXMEM_to_MEMWB), 
				   .addr(alu_out_from_EXMEM_to_MEMWB), .rd(dmem_rdata) );	   
				 
    Multiplier multiplier_complement( .clk(clk), .dataA(rfile_rd1_from_IDEX_to_EXMEM), .dataB(rfile_rd2_from_IDEX_to_EXMEM), .dataOut(multi_dataout), .Signal(multiOperation), .reset(rst) );	
    HiLo hi_lo_ccomplement( .clk(clk), .MultAns(divu_data_out_from_EXMEM_to_MEMWB), .HiOut(HiOut), .LoOut(LoOut), .reset(rst) ) ;	
    Shifter shifter_complement( .in(rfile_rd2_from_IDEX_to_EXMEM), .shamt(shamt_32bits_from_IDEX_to_EXMEM), .Signal(srlOperation), .out(shifter_dataout), .reset(rst) ) ;
endmodule
