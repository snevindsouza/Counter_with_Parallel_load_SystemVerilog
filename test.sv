module test();
    import counter_pkg::*;
    EightBitEvenUpCounter E;
    reg clk, reset, load, enable;
    wire [7:0]out;
    reg [7:0]d, temp=8'b0;
    counter dut(.clk(clk),.enable(enable),.reset(reset),.load(load),.d(d),.q(out));

    always #5 clk = ~clk;

    initial begin          
        clk = 1'b0;
        load = 0;
        enable = 0;
        reset = 0;
        d = 8'b10100000; // 160 in decimal, change to whatever you want
        
        #50;// Wait for a few clock cycles to stabilize
        $dumpfile("Waveforms.vcd");
        $dumpvars(0,test); 
        // Testcase 1: Asynchronous reset
        repeat (10) begin
            reset = 1;
            E = new(clk, reset);
            E.constval(temp);//value of temp goes to package
            #10 $display(" enable=%b , load=%d, din=%d, count=%d Expected=%d ",enable,load,d,out,E.count);
            reset = 0;
        end

        // Testcase 2: Parallel load
        repeat (5) begin
            load = 1;
            E = new(clk, reset);
            E.constval(d);//value of d goes to package
            #10 $display(" enable=%b , load=%d, din=%d, count=%d Expected=%d",enable,load,d,out,E.count);
            load = 0;
        end

        // Testcase 3: Enable counter       
        temp=d;
        repeat (255) begin
            enable = 1;
            E = new(clk, reset);
            E.countval(temp);//value of temp goes to package and gets incremented
            #10 $display(" enable=%b , load=%d, din=%d, count=%d Expected=%d",enable,load,d,out,E.count);
            temp = E.count;
            enable = 0;
        end
       
        #1 $display("Testbench completed successfully!");
        $finish;
    end
endmodule