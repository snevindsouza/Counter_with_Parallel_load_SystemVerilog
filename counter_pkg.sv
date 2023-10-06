package counter_pkg;

class EightBitEvenUpCounter;
    // Member variables
    bit [7:0] count;
    bit clk;
    bit reset;

    // Constructor
    function new(bit clk1, bit reset1);
        clk = clk1;
        reset = reset1;
    endfunction

    //constant values come here from testcase 1 and 2
    function void constval(bit [7:0] value);
        count = value;
    endfunction 

    //from testcase 3
    function void countval(bit [7:0] value);
        count = value;
        count = count + 1;
    endfunction 
endclass

endpackage