module alu_ctl( clk, ALUOp, Funct, ALUOperation, multCtl, shiftLeftCtl, sllMuxDst );
    input clk ;
    input [1:0] ALUOp;
    input [5:0] Funct;
    output [2:0] ALUOperation;
    reg    [2:0] ALUOperation;
	
	output sllMuxDst ;
	output [5:0]multCtl ;
	output [5:0]shiftLeftCtl ;
	reg [5:0] temp ;
    reg [6:0] counter ;
    // symbolic constants for instruction function code
    parameter F_add = 6'd32;
    parameter F_sub = 6'd34;
    parameter F_and = 6'd36;
    parameter F_or  = 6'd37;
	parameter F_ori  = 6'd13;
    parameter F_slt = 6'd42;
    parameter F_mult = 6'd24;
    parameter F_sll = 6'd00 ;
	
	
    // symbolic constants for ALU Operations
    parameter ALU_add = 3'b010;
    parameter ALU_sub = 3'b110;
    parameter ALU_and = 3'b000;
    parameter ALU_or  = 3'b001;
    parameter ALU_slt = 3'b111;
    always @(ALUOp or Funct)
    begin
        case (ALUOp) 
            2'b00 : ALUOperation = ALU_add;
            2'b01 : ALUOperation = ALU_sub;
			2'b11 : ALUOperation = ALU_or;  // ori 強制or
            2'b10 : case (Funct) 
                        F_add : ALUOperation = ALU_add;
                        F_sub : ALUOperation = ALU_sub;
                        F_and : ALUOperation = ALU_and;
                        F_or  : ALUOperation = ALU_or;
                        F_slt : ALUOperation = ALU_slt;
                        default ALUOperation = 3'bxxx;
                    endcase
            default ALUOperation = 3'bxxx;
        endcase
    end
	
	
    always@( Funct )
    begin
        if ( Funct == F_mult )
        begin
            counter = 0 ;
        end
    /*
    如果訊號改變成除法 就把counter歸0
    */
    end

    always@( posedge clk )
    begin
      temp = Funct ;
      if ( Funct == F_mult )
      begin
        counter = counter + 1 ;
        if ( counter == 33 )
        begin
            temp = 6'b111111 ; // Open HiLo reg for Mult
            counter = 0 ;
        end
      end
    /*
    數32個clk然後開啟HiLo暫存器給除法器放值進去
    */
    end
	
	assign srlMuxDst = Funct == F_sll ? 1'b1 : 1'b0 ;
	assign multCtl = Funct ;
	assign shiftLeftCtl = Funct ;
	
endmodule

