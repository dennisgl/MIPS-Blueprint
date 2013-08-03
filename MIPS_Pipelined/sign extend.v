/*
	Title: Sign Extend
	Author: Selene (Computer System and Architecture Lab, ICE, CYCU)
	
	Input Port
		1. immed_in: Ū�J����sign extend���
	Output Port
		1. ext_immed_out: ��X�w����sign extend���
*/
module sign_extend( immed_in, ext_immed_out, extndDecide );
	input[15:0] immed_in;
	input extndDecide ; // �P�_�O���Oandi     , andi��entndDecide�O1
	output[31:0] ext_immed_out;
	assign ext_immed_out = extndDecide ? { {16{1'b0}}, immed_in } : { {16{immed_in[15]}}, immed_in };
endmodule
