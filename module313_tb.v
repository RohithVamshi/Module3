module module33_tb( );
parameter datawidth = 8;
 reg [datawidth-1:0] a,b,c;
wire [2*datawidth-1:0] result;


module33 instance1 (.a(a),.b(b),.c(c),.result(result));

integer i =0;
initial begin

a=i;
forever#20 a=a+1;

end

integer i =0;
initial begin

b=i;
forever#20 b=b+2;

end
integer i =0;
initial begin

c=i;
forever#20 c=c+3;

end






endmodule
