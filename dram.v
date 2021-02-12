module dram(clk,iv,row_num,ov,row);
input clk,iv;
input [3:0] row_num;
output reg[31:0] row;
output reg ov;

reg [3:0] open_row;
reg [31:0] bank [0:15];

initial begin
open_row <=4'bz;
ov = 0;
bank[0] <=0;
bank[1] <=1;
bank[2] <=2;
bank[3] <=3;
bank[4] <=4;
bank[5] <=5;
bank[6] <=6;
bank[7] <=7;
bank[8] <=8;
bank[9] <=9;
bank[10] <=10;
bank[11] <=11;
bank[12] <=12;
bank[13] <=13;
bank[14] <=14;
bank[15] <=15;
end

always@(posedge clk) begin
 if(iv==1)begin
  if(open_row === 4'bz)begin// row miss
   open_row <= row_num;
   ov <= 0;
   row<=#10 bank[row_num];
   ov <= #10 1;
   //ov<=#20 0;
   end
  else if(open_row === row_num)begin // row hit
   row <= bank[row_num];
   ov <=1;
   end
  else begin // row conflict
   open_row<= row_num;
   ov<=0;
   row<=#20 bank[row_num];
   ov <= #20 1;
   end
  end
 end
 
endmodule
 