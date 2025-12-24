module flip_flop
(
    input wire sys_clk, //系统时钟，50Hz
    input wire sys_rst_n,
    input wire key_in,

    output reg led_out
);

//涉及时钟信号，一定要使用非阻塞赋值
always @(posedge sys_clk)
    if (sys_rst_n == 1'b0)
        led_out <= 1'b0;
    else
        led_out <= key_in;

endmodule
