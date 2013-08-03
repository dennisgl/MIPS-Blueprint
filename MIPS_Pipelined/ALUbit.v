
module ALUbit( ai, bi, ci, Signal, bitOut, cout, less, set );

input less ;
input ai, bi, ci ;
input [2:0] Signal ;

output bitOut, cout ;
output set ;


parameter AND = 3'b000;

parameter OR  = 3'b001;

parameter ADD = 3'b010;

parameter SUB = 3'b110;

parameter SLT = 3'b111;



wire addsubout, andout, orout, sltout ;
wire temp ;

assign sltout = less ;

assign andout = ai & bi ;
assign orout = ai | bi ;
assign set = addsubout ;

wire binvert = Signal == ADD ? 0 : 1 ;
wire binvertB = bi ^ binvert ;

FullAdder a1( ai, binvertB, ci, addsubout, cout ) ;

// control output result
Mux5 m5( addsubout, addsubout, sltout, andout, orout, Signal, temp ) ;
 
assign bitOut = temp ;

endmodule