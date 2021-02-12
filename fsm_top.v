`include "./fsm.v"

module FSM_top;
reg x;
reg clk;
wire out;
fsm uut(clk,x,out);

always @(posedge clk) begin
 $display("Input Bit: %b, Time: %d, Output: %b \n",x, $time, out);
 end

initial begin 
 forever begin
  clk=0;
  #5
  clk=1;
  #5
  clk=0;
  end
 end
 
initial begin
 #3
 x<=0;
 #10
 x<=1;
 #10
 x<=0;
 #10
 x<=1;
 #10
 x<=0;
 #10
 x<=0;
 #10
 x<=0;
 #10
 x<=1;
 #10
 x<=0;
 #10
 x<=1;
 #10
 x<=0;
 end

initial begin
 #100;
 $finish;
 end

endmodule
 