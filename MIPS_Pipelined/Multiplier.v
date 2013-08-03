module Multiplier(clk, dataA, dataB, dataOut , Signal, reset);
     
    input reset,clk;
    input [6:0] Signal ;
    input [31:0] dataA, dataB;
    output [63:0] dataOut ;
    reg [63:0] dataOut;
 
    parameter s0 = 0, s1 = 1, s2 = 2;
    reg [5:0] count = 0;
    reg [1:0] state = 0;
    reg [63:0] P,  T;

    reg [31:0] y_reg;
 
    always @(posedge clk) begin
        case (state)
            s0: begin
                count <= 0;
                P <= 0;
                y_reg <= dataB;
                T <= {{31{1'b0}}, dataA};
                state <= s1;
            end
            s1: begin
                if(count == 5'b11111)
                    state <= s2;
                else begin
                    if(y_reg[0] == 1'b1)
                        P <= P + T;
                    else
                        P <= P;
                    y_reg <= y_reg >> 1;
                    T <= T << 1;
                    count <= count + 1;
                    state <= s1;
                end
            end
            s2: begin
     
           dataOut <= P;
           state <= s0;
            end
            default: ;

        endcase
    end
 
endmodule