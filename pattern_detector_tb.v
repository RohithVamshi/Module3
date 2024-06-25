module pattern_detector_tb();
parameter dw=8;
parameter pattern = 8'd18;

reg clk;
reg [dw-1:0] a;
reg [dw-1:0]b;
wire [2*dw-1:0] c;
wire pattern_detector;

pattern_detector#(dw,pattern)dut(.clk(clk),.a(a),.b(b),.c(c),.pattern_detector( pattern_detector));

initial
begin
clk=1;
forever
#20
clk = ~clk;
end

integer i =0;
initial begin
a='d0;
forever
#40
a=a+1;
end


initial 
begin
b='d0;
forever
#40
b=b+2;
end

endmodule
