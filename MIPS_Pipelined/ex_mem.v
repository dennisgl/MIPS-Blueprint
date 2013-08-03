module ex_mem (  clk, rst, en_reg, add32three_in, add32three_out, zero_in, zero_out, alu_in, alu_out,EMrd_out2, EMrd_in2, rfile_wn_in, rfile_wn_out, 
                 in_shiftCtl, out_shiftCtl, 
                 in_wb_regwrite, in_wb_memtoreg, in_m_branch, in_m_memread, in_m_mem,
                 out_wb_regwrite, out_wb_memtoreg, out_m_branch, Jump_in, Jump_out, out_m_memread, out_m_mem, jmpaddr_in, jmpaddr_out, multi_data_in, multi_data_out, 
                 shifter_dataout_in, shifter_dataout_out );
    input clk, rst, en_reg, zero_in;
	input[4:0] rfile_wn_in ;
    input[31:0] add32three_in, alu_in, EMrd_in2;
    output[31:0] alu_out, add32three_out , EMrd_out2;
	output[4:0]  rfile_wn_out ;
	output zero_out ;
    reg [31:0] alu_out, add32three_out, EMrd_out2;
    reg[4:0]  rfile_wn_out ;
	reg zero_out ;
	
	input[31:0] jmpaddr_in ;
	output[31:0] jmpaddr_out ;
	reg[31:0] jmpaddr_out ;
	
	input[63:0] multi_data_in ;
	output[63:0] multi_data_out ;
	reg[63:0] multi_data_out ;
	
	input[31:0] shifter_dataout_in ;
	output[31:0] shifter_dataout_out ;
	reg[31:0] shifter_dataout_out ;
	
	// control port
	input in_wb_regwrite, in_wb_memtoreg, in_m_branch, in_m_memread, in_m_mem, Jump_in, in_shiftCtl ;
	output out_wb_regwrite, out_wb_memtoreg, out_m_branch, out_m_memread, out_m_mem, Jump_out, out_shiftCtl;
	reg out_wb_regwrite, out_wb_memtoreg, out_m_branch, out_m_memread, out_m_mem, Jump_out, out_shiftCtl ;
	
	always @( posedge clk ) begin
        if ( rst )
			shifter_dataout_out <= 32'b0;
        else if ( en_reg )
			shifter_dataout_out <= shifter_dataout_in;
    end
	
	always @( posedge clk ) begin
        if ( rst )
			multi_data_out <= 64'b0;
        else if ( en_reg )
			multi_data_out <= multi_data_in;
    end
	
	always @( posedge clk ) begin
        if ( rst )
			jmpaddr_out <= 31'b0;
        else if ( en_reg )
			jmpaddr_out <= jmpaddr_in;
    end
	
   
    always @( posedge clk ) begin
        if ( rst )
			zero_out <= 32'b0;
        else if ( en_reg )
			zero_out <= zero_in;
    end
	
	always @( posedge clk ) begin
        if ( rst )
			rfile_wn_out <= 32'b0;
        else if ( en_reg )
			rfile_wn_out <= rfile_wn_in;
    end
   
    always @( posedge clk ) begin
        if ( rst )
			alu_out <= 32'b0;
        else if ( en_reg )
			alu_out <= alu_in;
    end
    always @( posedge clk ) begin
        if ( rst )
			add32three_out <= 32'b0;
	else if ( en_reg )
			add32three_out <= add32three_in;
    end
    always @( posedge clk ) begin
        if ( rst )
			EMrd_out2 <= 32'b0;
        else if ( en_reg )
			EMrd_out2 <= EMrd_in2;
    end
	
	// == control reg
	
	always @( posedge clk ) begin
        if ( rst )
			out_wb_regwrite <= 1'b0;
        else if ( en_reg )
			out_wb_regwrite <= in_wb_regwrite;
    end
	
	always @( posedge clk ) begin
        if ( rst )
			out_wb_memtoreg <= 1'b0;
        else if ( en_reg )
			out_wb_memtoreg <= in_wb_memtoreg;
    end
	
	always @( posedge clk ) begin
        if ( rst )
			out_m_branch <= 1'b0;
        else if ( en_reg )
			out_m_branch <= in_m_branch;
    end
	
	always @( posedge clk ) begin
        if ( rst )
			out_m_memread <= 1'b0;
        else if ( en_reg )
			out_m_memread <= in_m_memread;
    end
	
	always @( posedge clk ) begin
        if ( rst )
			out_m_mem <= 1'b0;
        else if ( en_reg )
			out_m_mem <= in_m_mem;
    end	
	
	always @( posedge clk ) begin
        if ( rst )
			Jump_out <= 1'b0;
        else if ( en_reg )
			Jump_out <= Jump_in;
    end	
	
	always @( posedge clk ) begin
        if ( rst )
			out_shiftCtl <= 1'b0;
        else if ( en_reg )
			out_shiftCtl <= in_shiftCtl;
    end	
endmodule  