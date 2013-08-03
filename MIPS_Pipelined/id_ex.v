module id_ex (  clk, rst, en_reg, add32_tin, add32_tout, rfrd_out1, rfrd_out2, rfrd_in1, rfrd_in2, 
			    extnd_out, extnd_in, rt_in, rd_in, rt_out, rd_out,
				
				RegDst_in, ALUSrc_in, MemtoReg_in, RegWrite_in,
				MemRead_in, MemWrite_in, Branch_in, BneDst_in, ALUOp_in, funct_in,
				RegDst_out, ALUSrc_out, MemtoReg_out, RegWrite_out, MemRead_out, MemWrite_out,
				Branch_out, BneDst_out, ALUOp_out, funct_out, Jump_in, Jump_out, jmpaddr_in, jmpaddr_out, shamt_32bits_in, shamt_32bits_out );
    input clk, rst, en_reg ;
    input[31:0]	 add32_tin ;
    output[31:0]  add32_tout ;
    output[31:0] rfrd_out1, rfrd_out2, extnd_out;
    reg [31:0] rfrd_out1, rfrd_out2, add32_tout, extnd_out;
	input[1:0] ALUOp_in;
    input RegDst_in, ALUSrc_in, MemtoReg_in, RegWrite_in, MemRead_in, MemWrite_in, Branch_in, BneDst_in, Jump_in ;
	input [5:0]funct_in;
	output[1:0] ALUOp_out;
	output RegDst_out, ALUSrc_out, MemtoReg_out, RegWrite_out, MemRead_out, MemWrite_out, Branch_out, BneDst_out, Jump_out;
    input [31:0] rfrd_in1, rfrd_in2, extnd_in;
	input [4:0] rt_in, rd_in ;
	output[4:0] rt_out, rd_out ;
	output [5:0]funct_out;
	reg[4:0] rt_out, rd_out ;
	reg RegDst_out, ALUSrc_out, MemtoReg_out, RegWrite_out, MemRead_out, MemWrite_out, Branch_out, BneDst_out, Jump_out ;
	reg[1:0] ALUOp_out;
	reg[5:0]funct_out;
	
	input[31:0] jmpaddr_in ;
	output[31:0] jmpaddr_out ;
	reg[31:0] jmpaddr_out ;
	
	input[31:0] shamt_32bits_in ;
	output[31:0] shamt_32bits_out ;
	reg[31:0] shamt_32bits_out ;
    
	always @( posedge clk ) begin
        if ( rst )
			shamt_32bits_out <= 31'd0;
        else if ( en_reg )
			shamt_32bits_out <= shamt_32bits_in;
    end
	
    always @( posedge clk ) begin
        if ( rst )
			jmpaddr_out <= 31'd0;
        else if ( en_reg )
			jmpaddr_out <= jmpaddr_in;
    end
   
   always @( posedge clk ) begin
        if ( rst )
			rt_out <= 32'b0;
        else if ( en_reg )
			rt_out <= rt_in;
    end
	
	always @( posedge clk ) begin
        if ( rst )
			rd_out <= 32'b0;
        else if ( en_reg )
			rd_out <= rd_in;
    end
   
    always @( posedge clk ) begin
        if ( rst )
			rfrd_out1 <= 32'b0;
        else if ( en_reg )
			rfrd_out1 <= rfrd_in1;
    end
    always @( posedge clk ) begin
        if ( rst )
			rfrd_out2 <= 32'b0;
        else if ( en_reg )
			rfrd_out2 <= rfrd_in2;
    end
    always @( posedge clk ) begin
        if ( rst )
			add32_tout <= 32'b0;
	else if ( en_reg )
			add32_tout <= add32_tin;
    end
    always @( posedge clk ) begin
        if ( rst )
			extnd_out <= 32'b0;
	else if ( en_reg )
			extnd_out <= extnd_in;
    
	
    end	
    always @( posedge clk ) begin
        if ( rst )
		    RegDst_out <= 1'd0;
		else if ( en_reg )
			RegDst_out <= RegDst_in;
    end
	
	always @( posedge clk ) begin
        if ( rst )
		    ALUSrc_out <= 1'd0;
		else if ( en_reg )
			ALUSrc_out <= ALUSrc_in;
    end
	
	always @( posedge clk ) begin
        if ( rst )
		    MemtoReg_out <= 1'd0;
		else if ( en_reg )
			MemtoReg_out <= MemtoReg_in;
    end
	
	always @( posedge clk ) begin
        if ( rst )
		    RegWrite_out <= 1'd0;
		else if ( en_reg )
			RegWrite_out <= RegWrite_in;
    end
	
	always @( posedge clk ) begin
        if ( rst )
		    MemRead_out <= 1'd0;
		else if ( en_reg )
			MemRead_out <= MemRead_in;
    end
	
	always @( posedge clk ) begin
        if ( rst )
		    MemWrite_out <= 1'd0;
		else if ( en_reg )
			MemWrite_out <= MemWrite_in;
    end
	
	always @( posedge clk ) begin
        if ( rst )
		    Branch_out <= 1'd0;
		else if ( en_reg )
			Branch_out <= Branch_in;
    end 
	

	
	always @( posedge clk ) begin
        if ( rst )
		    BneDst_out <= 1'd0;
		else if ( en_reg )
			BneDst_out <= BneDst_in;
    end
	

	
	always @( posedge clk ) begin
        if ( rst )
		    ALUOp_out <= 2'd0;
		else if ( en_reg )
			ALUOp_out <= ALUOp_in;
    end
	
	always @( posedge clk ) begin
        if ( rst )
		    funct_out <= 5'd0;
		else if ( en_reg )
			funct_out <= funct_in;
    end
	
	always @( posedge clk ) begin
        if ( rst )
		    Jump_out <= 1'd0;
		else if ( en_reg )
			Jump_out <= Jump_in;
    end
endmodule  
