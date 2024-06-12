module module33#(

parameter datawidth=8 )
(input [datawidth-1:0] a,
input [datawidth-1:0] b, input [datawidth-1:0] c, 
output reg [2*datawidth-1:0] result);

always @(*)
begin
result = (a)*(b+c);
end

endmodule
