

module alu(ctl, a, b, result, zero) ;

input [31:0] a ;

input [31:0] b ;

input [2:0] ctl ;

output [31:0] result ;
output zero ;



wire [31:0] temp ;


// define control sign
// ( can determine which is we need.) 

parameter AND = 3'b000;

parameter OR  = 3'b001;

parameter ADD = 3'b010;

parameter SUB = 3'b110;

parameter SLT = 3'b111;



parameter ANDI = 3'bXXX;






wire [31:0] c ; // carryIn
assign c[0] = ctl == ADD ? 1'b0 : 1'b1 ; //

wire cout ;     // carryOut

wire set  ;     // for "slt" line

ALUbit f0( a[0], b[0],  c[0], ctl, temp[0], c[1], set, z ) ;
           
ALUbit f1( a[1], b[1],  c[1], ctl, temp[1], c[2], 1'b0, z ) ;
           
ALUbit f2( a[2], b[2],  c[2], ctl, temp[2], c[3], 1'b0, z ) ;
           
ALUbit f3( a[3], b[3],  c[3], ctl, temp[3], c[4], 1'b0, z ) ;
           
ALUbit f4( a[4], b[4],  c[4], ctl, temp[4], c[5], 1'b0, z ) ;
           
ALUbit f5( a[5], b[5],  c[5], ctl, temp[5], c[6], 1'b0, z ) ;
           
ALUbit f6( a[6], b[6],  c[6], ctl, temp[6], c[7], 1'b0, z ) ;
           
ALUbit f7( a[7], b[7],  c[7], ctl, temp[7], c[8], 1'b0, z ) ;
           
ALUbit f8( a[8], b[8],  c[8], ctl, temp[8], c[9], 1'b0, z ) ;
           
ALUbit f9( a[9], b[9],  c[9], ctl, temp[9], c[10], 1'b0, z ) ;

ALUbit f10( a[10], b[10],  c[10], ctl, temp[10], c[11], 1'b0, z ) ;

ALUbit f11( a[11], b[11],  c[11], ctl, temp[11], c[12], 1'b0, z ) ;

ALUbit f12( a[12], b[12],  c[12], ctl, temp[12], c[13], 1'b0, z ) ;

ALUbit f13( a[13], b[13],  c[13], ctl, temp[13], c[14], 1'b0, z ) ;

ALUbit f14( a[14], b[14],  c[14], ctl, temp[14], c[15], 1'b0, z ) ;

ALUbit f15( a[15], b[15],  c[15], ctl, temp[15], c[16], 1'b0, z ) ;

ALUbit f16( a[16], b[16],  c[16], ctl, temp[16], c[17], 1'b0, z ) ;

ALUbit f17( a[17], b[17],  c[17], ctl, temp[17], c[18], 1'b0, z ) ;

ALUbit f18( a[18], b[18],  c[18], ctl, temp[18], c[19], 1'b0, z ) ;

ALUbit f19( a[19], b[19],  c[19], ctl, temp[19], c[20], 1'b0, z ) ;

ALUbit f20( a[20], b[20],  c[20], ctl, temp[20], c[21], 1'b0, z ) ;

ALUbit f21( a[21], b[21],  c[21], ctl, temp[21], c[22], 1'b0, z ) ;

ALUbit f22( a[22], b[22],  c[22], ctl, temp[22], c[23], 1'b0, z ) ;

ALUbit f23( a[23], b[23],  c[23], ctl, temp[23], c[24], 1'b0, z ) ;

ALUbit f24( a[24], b[24],  c[24], ctl, temp[24], c[25], 1'b0, z ) ;

ALUbit f25( a[25], b[25],  c[25], ctl, temp[25], c[26], 1'b0, z ) ;

ALUbit f26( a[26], b[26],  c[26], ctl, temp[26], c[27], 1'b0, z ) ;

ALUbit f27( a[27], b[27],  c[27], ctl, temp[27], c[28], 1'b0, z ) ;

ALUbit f28( a[28], b[28],  c[28], ctl, temp[28], c[29], 1'b0, z ) ;

ALUbit f29( a[29], b[29],  c[29], ctl, temp[29], c[30], 1'b0, z ) ;

ALUbit f30( a[30], b[30],  c[30], ctl, temp[30], c[31], 1'b0, z ) ;

ALUbit f31( a[31], b[31],  c[31], ctl, temp[31], cout, 1'b0, set ) ;




assign zero = ctl == SUB ? ( temp == 32'd0 ? 1'b1 : 1'b0 ) : 1'b0 ; // not is sub , zero is false
                                                                       // temp is 0 , is beq  
assign result = ctl == SLT ? ( temp[0] ? 32'd1 : 32'd0 ) : temp ;

endmodule