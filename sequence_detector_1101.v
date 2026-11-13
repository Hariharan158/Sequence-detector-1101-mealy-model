`timescale 1ns/1ps
module sequence_detector_1101 (
    input clk,
    input reset,
    input din,
    output reg dout
);

  
    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;

    reg [1:0] state, next_state;

   
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

  
    always @(*)
    begin
        dout = 1'b0;
        next_state = state;

        case (state)

            S0: begin
                if (din == 1'b1)
                    next_state = S1;
                else
                    next_state = S0;
            end

            S1: begin
                if (din == 1'b1)
                    next_state = S2;
                else
                    next_state = S0;
            end

            S2: begin
                if (din == 1'b0)
                    next_state = S3;
                else
                    next_state = S2;
            end

            S3: begin
                if (din == 1'b1) begin
                    dout = 1'b1;
                    next_state = S1;
                end
                else
                    next_state = S0;
            end

            default: begin
                next_state = S0;
                dout = 1'b0;
            end

        endcase
    end

endmodule
