module if_id (  clk, rst, en_reg, add32_in, add32_out, insmem_in, insmem_out, jmpaddr_in, jmpaddr_out );
    input clk, rst, en_reg;
    input[31:0]	insmem_in, add32_in;
	
	input[25:0] jmpaddr_in ;
	output[25:0] jmpaddr_out ;
	reg[25:0] jmpaddr_out ;
	
    output[31:0] insmem_out, add32_out;
    reg [31:0] insmem_out, add32_out;
   
    always @( posedge clk ) begin
        if ( rst )
			jmpaddr_out <= 26'b0;
        else if ( en_reg )
			jmpaddr_out <= jmpaddr_in;
    end
   
    always @( posedge clk ) begin
        if ( rst )
			insmem_out <= 32'b0;
        else if ( en_reg )
			insmem_out <= insmem_in;
    end
	
    always @( posedge clk ) begin
        if ( rst )
			add32_out <= 32'b0;
	else if ( en_reg )
			add32_out <= add32_in;
    end
endmodule 