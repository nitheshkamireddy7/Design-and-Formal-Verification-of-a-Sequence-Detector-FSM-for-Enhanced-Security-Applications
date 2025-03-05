`timescale 1ns/1ps

module detector_fsm_tb();
  
  logic clk, rst, in;
  logic out;
  
  detector_fsm uut (
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out)
  );
  
  // Clock generation
  always #5 clk = ~clk;
  
  initial begin
    clk = 0;
    rst = 0;
    in = 0;
    
    // Step 1: Enter isolation state (0110)
    $display("Entering Isolation State");
    #10 in = 0; #10 in = 1; #10 in = 1; #10 in = 0; #10 in = 0; #10 in = 0;
    
    // Step 2: Apply reset
    $display("Applying Reset");
    #10 rst = 1; #10 rst = 0;
    
    // Step 3: Provide detection sequence (000010010100)
    $display("Providing Detection Sequence");
    #10 in = 0; #10 in = 0; #10 in = 0; #10 in = 0;
    #10 in = 1; #10 in = 0; #10 in = 0; #10 in = 1;
    #10 in = 0; #10 in = 1; #10 in = 0; #10 in = 0;
    
    if (out) $display("Sequence Matched!");
    
    // Step 4: Enter deadlock state (0111)
    $display("Entering Deadlock State");
    #10 in = 1; #10 in = 1; #10 in = 1; #10 in = 1; #10 in = 1;
    $display("Applying Reset");
    #10 rst = 1; #10 rst = 0; #10 in = 1; #10 in = 1; #10 in = 1;

    
    #50;
    $stop;
  end
  
endmodule

