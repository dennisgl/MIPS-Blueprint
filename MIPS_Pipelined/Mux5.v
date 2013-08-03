
module Mux5( addout, subout, sltout, andout, orout, s, y ) ;
  input addout, subout, sltout, andout, orout ;
  input [2:0] s ;
  output y ;

  parameter AND = 3'b000;

  parameter OR  = 3'b001;

  parameter ADD = 3'b010;

  parameter SUB = 3'b110;

  parameter SLT = 3'b111;



  wire  a,b,c,d,e ;
  
  assign a = s == AND ? 1 : 0 ;
  assign b = s == OR ? 1 : 0 ;
  assign c = s == ADD ? 1 : 0 ;
  assign d = s == SUB ? 1 : 0 ;
  assign e = s == SLT ? 1 : 0 ;
  
  assign y = a ? andout : b ? orout : c ? addout : d ? subout : e ? sltout : y ;
 
endmodule 