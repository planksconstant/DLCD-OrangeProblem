`timescale 1ns / 1ps

module tb_traffic_light;
    reg clk;
    reg reset;
    wire red;
    wire green;
    wire yellow;

    traffic_light uut (
        .clk(clk),
        .reset(reset),
        .red(red),
        .green(green),
        .yellow(yellow)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb_traffic_light.vcd");
        $dumpvars(0, tb_traffic_light);

        $display("--------------------------------------------");
        $display("Time | Reset | Red | Green | Yellow | State  ");
        $display("--------------------------------------------");
        $monitor("%4t |   %b   |  %b  |   %b   |   %b    | %b%b", 
                 $time, reset, red, green, yellow, uut.state[1], uut.state[0]);

        clk = 0;
        reset = 1;
        #12;
        
        reset = 0;
        #90;

        $finish;
    end

endmodule
