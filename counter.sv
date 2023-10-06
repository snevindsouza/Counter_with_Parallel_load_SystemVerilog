module counter(input wire clk, enable, reset, load,input wire[7:0]d,output wire[7:0]q);
    wire [7:0]a;
    wire [7:0]w;
    wire [7:0]c;
    
    assign a[0]=(q[0]^enable);
    assign w[0]=(q[0]&enable);
    assign a[1]=(q[1]^w[0]);
    assign w[1]=(q[1]&w[0]);
    assign a[2]=(q[2]^w[1]);
    assign w[2]=(q[2]&w[1]);
    assign a[3]=(q[3]^w[2]);
    assign w[3]=(q[3]&w[2]);
    assign a[4]=(q[4]^w[3]);
    assign w[4]=(q[4]&w[3]);
    assign a[5]=(q[5]^w[4]);
    assign w[5]=(q[5]&w[4]);
    assign a[6]=(q[6]^w[5]);
    assign w[6]=(q[6]&w[5]);
    assign a[7]=(q[7]^w[6]);

    mux m0(a[0],d[0],load,c[0]);
    mux m1(a[1],d[1],load,c[1]);
    mux m2(a[2],d[2],load,c[2]);
    mux m3(a[3],d[3],load,c[3]);
    mux m4(a[4],d[4],load,c[4]);
    mux m5(a[5],d[5],load,c[5]);
    mux m6(a[6],d[6],load,c[6]);
    mux m7(a[7],d[7],load,c[7]);

    dflip d0(clk,reset,c[0],q[0]);
    dflip d1(clk,reset,c[1],q[1]);
    dflip d2(clk,reset,c[2],q[2]);
    dflip d3(clk,reset,c[3],q[3]);
    dflip d4(clk,reset,c[4],q[4]);
    dflip d5(clk,reset,c[5],q[5]);
    dflip d6(clk,reset,c[6],q[6]);
    dflip d7(clk,reset,c[7],q[7]);
endmodule