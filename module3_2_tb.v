`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2024 09:24:32
// Design Name: 
// Module Name: module3_2_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module module3_2_tb();
  parameter Data_width = 16;  
  parameter Depth =10  ;    

    reg clk;
    reg rst;
    
    // AXI Stream Slave Interface
    reg [Data_width-1:0] s_data;
    reg s_valid;
    reg s_last;
    wire s_ready;

    // Configuration input
    reg [Data_width-1:0] k=4; 
    reg [Data_width-1:0] len=10;

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
        repeat(len)@(posedge clk)s_data = s_data +2;  
     end
    @(posedge clk)s_data =0;
    repeat(k)@(posedge clk);
    s_valid =0;
end

initial begin
     s_last =0; 
    repeat(2)@(posedge clk)s_last = 0; 
    forever begin
        repeat(len-1) @(posedge clk) s_last =0;
        @(posedge clk) s_last = 1;
        @(negedge clk) s_last =0;
    end
end

initial begin
    m_ready = 1;
    repeat(45)@(posedge clk) m_ready =1;
    
end


 
endmodule
