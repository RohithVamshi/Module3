
module module34

#(parameter dw=08)

( input clk,
    input reset,
    // slave data A
    input [dw-1:0]a, // data
    input a_valid,
    output reg a_ready,
    
    //slave data B
    input [dw-1:0]b,
    input b_valid,
    output reg b_ready,
    
    //slave data C
    input [dw-1:0]c,
    input c_valid,
    output reg c_ready,
    
    //slave data D
    input [dw-1:0]d,
    input d_valid,
    output reg d_ready,
    
    //master 
    output reg [2*dw-1:0] m_data,
    output reg m_valid,
    input m_ready
    );
    
    reg [dw-1:0] a1,b1,c1,d1;
    reg [2*dw-1:0] result;
    
   always @(posedge clk)
   begin 
   if (reset)
   begin
   a1 <= 0;
   b1<=0;
   c1<=0;
   d1<=0;
   end

if(a_valid & a_ready)
begin
a1<= a;
end

if(b_valid & b_ready)
begin
b1 <= b;
end

if(c_valid & c_ready)
begin
c1<=c;
end
 
 if(d_valid & d_ready)
 begin
 d1<=d;
end 

m_valid = (a_valid & b_valid & c_valid & d_valid);
 result = (a1+b1) * (c1 + d1);
end



always @(negedge clk)
begin
if(reset)
begin
a_ready <=0;
b_ready <=0;
c_ready <=0;
d_ready <=0;
end

else

begin
a_ready <= m_ready;
b_ready <= m_ready;
c_ready <= m_ready;
d_ready <= m_ready;
end
end

initial
begin

assign m_data = result;
end


endmodule
