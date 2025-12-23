module decoder
(
    input wire in1,
    input wire in2,
    input wire in3,

    output reg [7:0] out
);

//if语句的执行存在优先级，首先判断if，然后按顺序判断，直到满足某一个判断条件，则执行相应的代码。
/*
always@(in1,in2,in3) begin
    if({in1,in2,in3} == 3'b000)
        out = 8'b0000_0001 ;
    else if({in1,in2,in3} == 3'b001)
        out = 8'b0000_0010 ;
    else if({in1,in2,in3} == 3'b010)
        out = 8'b0000_0100 ;
    else if({in1,in2,in3} == 3'b011)
        out = 8'b0000_1000 ;
    else if({in1,in2,in3} == 3'b100)
        out = 8'b0001_0000 ;
    else if({in1,in2,in3} == 3'b101)
        out = 8'b0010_0000 ;
    else if({in1,in2,in3} == 3'b110)
        out = 8'b0100_0000 ;
    else if({in1,in2,in3} == 3'b111)
        out = 8'b1000_0000 ;
    else
        out = 8'b0000_0001 ;
end
*/
//组合逻辑使用阻塞赋值，case条件不存在执行顺序的问题。
always@(in1,in2,in3) begin
    case({in1,in2,in3})
        3'b000 : out = 8'b0000_0001 ;
        3'b001 : out = 8'b0000_0010 ;
        3'b010 : out = 8'b0000_0100 ;
        3'b011 : out = 8'b0000_1000 ;
        3'b100 : out = 8'b0001_0000 ;
        3'b101 : out = 8'b0010_0000 ;
        3'b110 : out = 8'b0100_0000 ;
        3'b111 : out = 8'b1000_0000 ;

        default: out = 8'b0000_0001 ;
    endcase
end

endmodule
