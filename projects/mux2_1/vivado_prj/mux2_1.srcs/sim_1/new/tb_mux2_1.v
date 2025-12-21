`timescale 1ns / 1ps

module tb_mux2_1();

reg in1;
reg in2;
reg sel;

wire out;//便于输出信号的观察

initial begin  //initial只执行一次
    in1 <= 1'b0;
    in2 <= 1'b0;
    sel <= 1'b0;

end

always #10 in1 = {$random} % 2;//对2求余，结果只有0和1
always #10 in2 = {$random} % 2;
always #10 sel = {$random} % 2;



//为了便于观察，可以添加一些系统函数
/*  $monitor,系统任务，用于持续监控信号变化,只要列表中的任何信号发生变化，就会自动输出一次。
    格式字符串 "@time %t:in1=%b in2=%b sel=%b out=%b"  @time：文字字符串，直接输出
    %t：时间格式，显示仿真时间
    %b：二进制格式显示信号值 */
initial begin
    $timeformat(-9,0,"ns",6);//设置时间格式，-9表示10^(-9)，表示ns。0表示小数点后的位数。6表示设置输出时间值时占用的最小字符数。如果时间值的位数小于此宽度，会在前面用空格填充以达到指定宽度。
    $monitor("@time %t:in1=%b in2=%b sel=%b out=%b",$time,in1,in2,sel,out);

end

//需要在此文件中调用被测仿真文件，实例化
// .表示连接
mux2_1  mux2_1_inst
(
    .in1  (in1  ),//输入信号1 如果不指定信号的类型，会默认为wire类型。表示仿真模块生成了in1，与被测模块的in1连接
    .in2  (in2  ),//输入信号2
    .sel  (sel  ),//输入选通信号

    .out  (out  )
);











endmodule

//这个就是仿真测试文件，进行输入信号的模拟
