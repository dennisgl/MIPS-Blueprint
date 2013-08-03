module mem_wb (  clk, rst, en_reg, alutwo_in, alutwo_out,DataMemoryRd_out, DataMemoryRd_in, rfile_wn_in, rfile_wn_out, in_shiftCtl, out_shiftCtl, 
                 MW_MemtoReg_in, MW_RegWrite_in, MW_MemtoReg_out, MW_RegWrite_out, shifter_dataout_in, shifter_dataout_out );
    input clk, rst, en_reg;
	input[4:0] rfile_wn_in ;
    input[31:0]	alutwo_in, DataMemoryRd_in;
    output[31:0] alutwo_out, DataMemoryRd_out;
	output[4:0]  rfile_wn_out ;
    reg [31:0] alutwo_out, DataMemoryRd_out;
	reg[4:0]  rfile_wn_out ;
    input MW_MemtoReg_in, MW_RegWrite_in, in_shiftCtl;
	output MW_MemtoReg_out, MW_RegWrite_out, out_shiftCtl;
	reg MW_MemtoReg_out, MW_RegWrite_out, out_shiftCtl;
	
	input[31:0] shifter_dataout_in ;
	output[31:0] shifter_dataout_out ;
	reg[31:0] shifter_dataout_out ;
	
	always @( posedge clk ) begin
        if ( rst )
			shifter_dataout_out <= 32'b0;
        else if ( en_reg )
			shifter_dataout_out <= shifter_dataout_in;
    end
	
    always @( posedge clk ) begin
        if ( rst )
			rfile_wn_out <= 32'b0;
        else if ( en_reg )
			rfile_wn_out <= rfile_wn_in;
    end
   
    always @( posedge clk ) begin
        if ( rst )
			alutwo_out <= 32'b0;
        else if ( en_reg )
			alutwo_out <= alutwo_in;
    end

    always @( posedge clk ) begin
        if ( rst )
			DataMemoryRd_out <= 32'b0;
        else if ( en_reg )
			DataMemoryRd_out <= DataMemoryRd_in;
    end
	
	
	// =====
	
	always @( posedge clk ) begin
        if ( rst )
		    MW_MemtoReg_out <= 1'd0;
		else if ( en_reg )
		    MW_MemtoReg_out <= MW_MemtoReg_in;

    end
	
	always @( posedge clk ) begin
        if ( rst )
		    MW_RegWrite_out <= 1'd0;
		else if ( en_reg )
			MW_RegWrite_out <= MW_RegWrite_in;

    end

	always @( posedge clk ) begin
        if ( rst )
		    out_shiftCtl <= 1'd0;
		else if ( en_reg )
			out_shiftCtl <= in_shiftCtl;

    end
endmodule  