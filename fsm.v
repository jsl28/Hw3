module fsm(clk,x,o);
input clk,x;
output reg o;

reg a,b,c,da,db,dc;

initial begin
a = 0;
b=0;
c =0;
end

always@(posedge clk) begin
 da = (~x & (c | a)) | (a & (b | c)) | (b & x) ;
 db = (a & b) | (~a & ~b & x) | (a & ~c & x);
 dc =  ~c | a | (b & x) | (~b & c & ~x);
 a = da;
 b = db;
 c = dc;
 if({da,db,dc} ===3'b101)begin
  o = 0;
  end
 else begin
  o  =1;
  end;
 end
 
endmodule