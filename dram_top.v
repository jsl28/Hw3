`include "./dram.v"

module dram_top;
reg[3:0] row_num;
reg iv;
reg clk;
wire ov;
wire[31:0] row;
dram uut(clk,iv,row_num,ov,row);

always @(negedge clk) begin
 if(ov==1) begin
  $display("row_num: %d, input_valid: %b, Time: %d, output_row: %b \n",row_num,iv,$time,row);
  end
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
 iv<=1; row_num<=10;
 #30
 iv<=0; row_num<=10;
 #30
 iv<=1; row_num<=14;
 #30
 iv<=1; row_num<=7;
 #30
 iv<=1; row_num<=6;
 #30
 iv<=1; row_num<=5;
 #30
 iv<=1; row_num<=4;
 #30
 iv<=0; row_num<=4;
 #30
 iv<=1; row_num<=3;
 #30
 iv<=1; row_num<=2;
 #30
 iv<=1; row_num<=1;
 #30
 iv<=1; row_num<=0;
 /*#10;
 inpb<=0;
 #10;
 inpb<=0;
 #10;
 inpb<=1; inp<=14;
 #10;
 inpb<=0;
 #10;
 inpb<=0;
 #10;
 inpb<=1; inp<=14;
 #10;
 inpb<=0;
 #10;
 inpb<=0;
 #10;
 inpb<=1; inp<=12;
 #10;
 inpb<=0;
 #10;
 inpb<=0;
 #10;
 inpb<=1; inp<=2;
 #10;
 inpb<=0;
 #10;
 inpb<=0;
 #10;
 inpb<=1; inp<=3;
 #10;
 inpb<=0;
 #10;
 inpb<=0;
 #10;
 inpb<=1; inp<=9;
 #10;
 inpb<=0;
 #10;
 inpb<=0;
 #10;
 inpb<=1; inp<=5;
 #10;
 inpb<=0;
 #10;
 inpb<=0;
 #10;
 inpb<=1; inp<=4;
 #10;
 inpb<=0;
 #10;
 inpb<=0;
 #10;
 inpb<=1; inp<=8;
 #10;
 inpb<=0;
 #10;
 inpb<=0;
 #10;
 inpb<=1; inp<=8;
 #10;
 inpb<=0;
 #10;
 inpb<=0;*/
 end

initial begin
 #300;
 $finish;
 end

endmodule