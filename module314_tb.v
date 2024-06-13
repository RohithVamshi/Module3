module module34_tb();

parameter dw=8;


reg clk;
reg reset;

//slave data A
reg [dw-1:0]a;
reg a_valid;
wire a_ready;
    
//slave data B
reg [dw-1:0]b;
reg b_valid;
wire b_ready;
    
//slave data C
reg [dw-1:0]c;
reg c_valid;
wire c_ready;

//slave data D
reg [dw-1:0]d;
reg d_valid;
wire d_ready;
    
    //master 
wire [2*dw-1:0]m_data;
wire m_valid;
reg m_ready;

module34 DUT(.clk(clk),.reset(reset),.a(a),.a_valid(a_valid),
            .a_ready(a_ready),.b(b),.b_valid(b_valid),.b_ready(b_ready),
            .c(c),.c_valid(c_valid),.c_ready(c_ready),
            .d(d),.d_valid(d_valid),.d_ready(d_ready),.m_data(m_data),
            .m_valid(m_valid),.m_ready(m_ready));

// Clock Generation
initial begin
    clk = 1;
    forever #10 clk = ~clk;
end
     
//reset
initial begin
    reset = 1'b1;
    #40;reset = 1'b0;
end

integer i=0;
initial 
begin
a=i;
forever #20 a= a+1;
end

initial 
begin
b=i;
forever #20 b= b+2;
end

initial 
begin
c=i;
forever #20 c= c+3;
end

initial 
begin
d=i;
forever #20 d= d+4;
end

initial
begin
a_valid =1;b_valid=1;c_valid=1;d_valid=1;
#60
a_valid =0;b_valid=1;c_valid=1;d_valid=1;
#20
a_valid =1;b_valid=1;c_valid=1;d_valid=1;

end

initial
begin
m_ready = 1;#90
m_ready = 0;#20
m_ready = 1;

end
endmodule
