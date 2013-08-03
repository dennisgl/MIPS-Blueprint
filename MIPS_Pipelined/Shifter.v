`timescale 1ns/1ns


module Shifter( in, shamt, Signal, out, reset );

input reset ;

input [31:0] in ;

input [31:0] shamt ;

input [5:0] Signal ;

output [31:0] out ;


wire [31:0] outLeft ;

wire [31:0] temp ;


parameter SLL = 6'b000000;


wire s0, s1, s2, s3, s4, s5 ;

wire [25:0] s6 ;
 
wire [31:0] tempOutLeft0, tempOutLeft1, tempOutLeft2, tempOutLeft3, tempOutLeft4 ;




assign s0 = shamt[0] ;

assign s1 = shamt[1] ;

assign s2 = shamt[2] ;

assign s3 = shamt[3] ;

assign s4 = shamt[4] ;

assign s5 = shamt[5] ;

assign tempOutLeft0 = s0 ? { in[30:0], 1'b0 } : in;
assign tempOutLeft1 = s1 ? { tempOutLeft0[29:0], 2'b0 } : tempOutLeft0 ;

assign tempOutLeft2 = s2 ? { tempOutLeft1[27:0], 4'b0 } : tempOutLeft1 ;

assign tempOutLeft3 = s3 ? { tempOutLeft2[23:0], 8'b0 } : tempOutLeft2 ;

assign tempOutLeft4 = s4 ? { tempOutLeft3[15:0], 16'b0 } : tempOutLeft3 ;

assign outLeft = s5 ? 32'b0 : tempOutLeft4 ;

assign temp = ( Signal == SLL ) ? outLeft : temp ;



assign out = temp ;
endmodule

