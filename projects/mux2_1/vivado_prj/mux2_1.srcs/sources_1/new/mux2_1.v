
module mux2_1
(
    input wire [0:0] in1,//输入信号1 如果不指定信号的类型，会默认为wire类型
    input wire       in2,//输入信号2
    input wire       sel,//输入选通信号
    
    output reg       out //always赋值的变量一定是reg类型，端口列表的最后一个信号不需要加逗号
);

always@(*) //*为通配符，等同于always(sel,in1,in2)
    if(sel==1'b1)
        out = in1;
    else
        out = in2;

endmodule
