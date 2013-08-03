module control_single( opcode, RegDst, ALUSrc, MemtoReg, RegWrite, 
					   MemRead, MemWrite, Branch, Jump, ALUOp, BneDst, ExtndDst);
    input[5:0] opcode;
    output RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, BneDst, ExtndDst;
   output[1:0] ALUOp;
    reg RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, BneDst, ExtndDst;
    reg[1:0] ALUOp;
  //  output [4:0] E;
//	output [3:0] M;
//	output [2:0] W;
    parameter R_FORMAT = 6'd0;
    parameter LW = 6'd35;
    parameter SW = 6'd43;
    parameter BEQ = 6'd4;
	parameter J = 6'd2;
    parameter BNE = 6'd5 ;
	parameter ORI = 6'd13 ;
    always @( opcode ) begin
        case ( opcode )
          R_FORMAT : 
          begin
				RegDst = 1'b1; ALUSrc = 1'b0; MemtoReg = 1'b0; RegWrite = 1'b1; MemRead = 1'b0;     // care about "jump"
				MemWrite = 1'b0; Branch = 1'b0; Jump = 1'b0; ALUOp = 2'b10; BneDst = 1'b0 ; ExtndDst = 1'b0 ;
          end
          LW :
          begin
				RegDst = 1'b0; ALUSrc = 1'b1; MemtoReg = 1'b1; RegWrite = 1'b1; MemRead = 1'b1; 
				MemWrite = 1'b0; Branch = 1'b0; Jump = 1'b0; ALUOp = 2'b00; BneDst = 1'b0 ; ExtndDst = 1'b0 ;
          end
          SW :
          begin
				RegDst = 1'bx; ALUSrc = 1'b1; MemtoReg = 1'bx; RegWrite = 1'b0; MemRead = 1'b0; 
				MemWrite = 1'b1; Branch = 1'b0; Jump = 1'b0; ALUOp = 2'b00; BneDst = 1'b0 ; ExtndDst = 1'b0 ;
          end
          BEQ :
          begin
				RegDst = 1'bx; ALUSrc = 1'b0; MemtoReg = 1'bx; RegWrite = 1'b0; MemRead = 1'b0; 
				MemWrite = 1'b0; Branch = 1'b1; Jump = 1'b0; ALUOp = 2'b01; BneDst = 1'b0 ; ExtndDst = 1'b0 ;
          end
		  J :
		  begin
				RegDst = 1'bx; ALUSrc = 1'b0; MemtoReg = 1'bx; RegWrite = 1'b0; MemRead = 1'b0; 
				MemWrite = 1'b0; Branch = 1'b1; Jump = 1'b1; ALUOp = 2'b01; BneDst = 1'b0 ; ExtndDst = 1'b0 ;
		  end
		  BNE :
		  begin
				RegDst = 1'bx; ALUSrc = 1'b0; MemtoReg = 1'bx; RegWrite = 1'b0; MemRead = 1'b0; 
				MemWrite = 1'b0; Branch = 1'b1; Jump = 1'b0; ALUOp = 2'b01; BneDst = 1'b1 ; ExtndDst = 1'b0 ;
		  
		  end
		  ORI :
		  begin
				RegDst = 1'b0; ALUSrc = 1'b1; MemtoReg = 1'b0; RegWrite = 1'b1; MemRead = 1'b0; 
				MemWrite = 1'b0; Branch = 1'b0; Jump = 1'b0; ALUOp = 2'b11 ; BneDst = 1'b0 ; ExtndDst = 1'b1 ;
		  end
		  
		  
		  
          default
		  
          begin
				$display("control_single unimplemented opcode %d", opcode);
				RegDst=1'bx; ALUSrc=1'bx; MemtoReg=1'bx; RegWrite=1'bx; MemRead=1'bx; 
				MemWrite=1'bx; Branch=1'bx; Jump = 1'bx; ALUOp = 2'bxx; BneDst = 1'bx ; ExtndDst = 1'bx ;
          end
          
        endcase
		

    end
endmodule

