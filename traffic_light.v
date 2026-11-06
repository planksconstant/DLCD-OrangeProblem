module traffic_light (
    input clk,
    input reset,
    output red,
    output green,
    output yellow
);

    reg [1:0] state;
    wire d1, d0;

    // D1 = S0
    // D0 = ~S1 & ~S0
    assign d1 = state[0];
    assign d0 = ~state[1] & ~state[0];

    // State register (2-bit plain register )
    always @(posedge clk) begin
        if (reset)
            state <= 2'b00;
        else
            state <= {d1, d0};
    end

    // moore equations 
    assign red    = ~state[1] & ~state[0]; // state 00
    assign green  = ~state[1] &  state[0]; // state 01
    assign yellow =  state[1] & ~state[0]; // state 10

endmodule
