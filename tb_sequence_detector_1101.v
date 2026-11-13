`timescale 1ns/1ps

module tb_sequence_detector_1101;

    reg clk;
    reg reset;
    reg din;
    wire dout;


    sequence_detector_1101 uut (
        .clk(clk),
        .reset(reset),
        .din(din),
        .dout(dout)
    );

    always #5 clk = ~clk;


    initial begin


        $dumpfile("sequence_detector.vcd");
        $dumpvars(0, tb_sequence_detector_1101);


        clk = 0;
        reset = 1;
        din = 0;

        #10 reset = 0;


        #10 din = 1;
        #10 din = 1;
        #10 din = 0;
        #10 din = 1;


        #10 din = 1;
        #10 din = 0;
        #10 din = 1;

        #20;

        $finish;
    end


    initial begin
        $monitor("Time=%0t | Reset=%b | Din=%b | Dout=%b",
                  $time, reset, din, dout);
    end

endmodule
