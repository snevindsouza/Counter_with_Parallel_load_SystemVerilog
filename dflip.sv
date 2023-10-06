module dflip(input wire clk, reset, d, output  reg q );

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 1'b0;
    else
        q <= d;
end
endmodule