`timescale 1ns / 1ps

module tb_flip_flop();

reg sys_clk;
reg sys_rst_n;
reg key_in;

wire led_out;

initial begin
    sys_clk = 1'b1;
    sys_rst_n <= 1'b0;
    key_in <= 1'b1;
    #20
    sys_rst_n <= 1'b1;
    #210
    sys_rst_n <= 1'b0;
    #40
    sys_rst_n <= 1'b1;
end


always #10 sys_clk = ~sys_clk;//每隔10ns反转一次

always #20 key_in <= {$random} % 2;

initial begin
    $timeformat(-9,0,"ns",6);
    $monitor("@time %t:sys_clk=%b",$time,sys_clk);
end

flip_flop flip_flop_inst
(
     .sys_clk(sys_clk ), //系统时钟，50Hz
     .sys_rst_n(sys_rst_n),
     .key_in(key_in),

     .led_out(led_out )
);


endmodule
