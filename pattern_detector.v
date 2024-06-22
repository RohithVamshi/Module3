module pattern_detector
#(parameter dw=8
)

(input clk,
input [dw-1:0] a,
input [dw-1:0] b,
output reg [(2*dw)-1:0] c,
output reg pattern_detector);

reg [dw-1:0]pattern=8'd18;
reg [(2*dw)-1:0]result;
reg [dw-1:0] a1,b1;


always @(posedge clk)

begin
a1<=a;
b1<=b;
end

always @(posedge clk)
begin
begin
result <= a1*b1;
end 
if (pattern == result)
pattern_detector =1'b1;
else
pattern_detector=1'b0;
end



always @(*)
assign c=result;

endmodule
