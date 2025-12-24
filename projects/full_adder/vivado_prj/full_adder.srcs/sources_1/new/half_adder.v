module  half_adder
(
    input   wire    in1 ,   //加数1
    input   wire    in2 ,   //加数2
    
    output  wire    sum ,   //两个数的加和
    output  wire    cout    //加和后的进位
);

//sum:两个数加和的输出
assign sum = in1 ^ in2;
//cout:两个数进位的输出
assign cout = in1 & in2;

endmodule   
