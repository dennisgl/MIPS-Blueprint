module HiLo( clk, MultAns, HiOut, LoOut, reset );
input clk ;
input reset ;
input [63:0] MultAns ;
output [31:0] HiOut ;
output [31:0] LoOut ;

reg [63:0] HiLo ;

always@( posedge clk or reset )
begin
  if ( reset )
  begin
    HiLo = 64'b0 ;
  end
  else
  begin
    HiLo = MultAns ;  // store ans
  end
end

assign HiOut = HiLo[63:32] ;  // quotient
assign LoOut = HiLo[31:0] ;   // remainder

endmodule