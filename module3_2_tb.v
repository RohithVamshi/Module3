module module3_2_tb();
  parameter Data_width = 8;  
  parameter Depth = 16  ;    

    reg clk;
    reg rst;
    
    // AXI Stream Slave Interface
    reg [Data_width-1:0] s_data;
    reg s_valid;
    reg s_last;
    wire s_ready;

    // Configuration input
    reg [Data_width-1:0] k=1; 
    reg [Data_width-1:0] len=8;

    // AXI Stream Master Interface
    wire [Data_width-1:0] m_data;
    wire m_valid;
    wire m_last;
    reg m_ready;

    // Status signals
    wire full;
    wire empty;
    
    
    
module3_2 #(Data_width, Depth) dut (clk, rst, s_data, s_valid, s_last, s_ready, k, len, m_data, m_valid,  m_last, m_ready, full, empty);


initial begin
    clk = 0;
    forever #20 clk = ~clk;
end

initial   begin
    rst = 1;
    #40 rst = 0;
end


initial begin
    s_data = 0;
    s_valid =0;
    repeat(2)@(posedge clk)
     s_valid =1;;
    forever begin
        // 1st frame
        repeat(len)@(posedge clk)s_data = s_data +1;  
     end
    @(posedge clk)s_data =0;
    repeat(k)@(posedge clk);
    s_valid =0;
end

initial 
begin
s_last = 0;
#360
s_last =1;
#40
s_last=0;
#360
s_last =1;
#40
s_last=0;
#360
s_last =1;
#40
s_last=0;
#360
s_last =1;
end

initial begin
    m_ready = 1;
    repeat(85)@(posedge clk) m_ready =1;
    
end

endmodule
