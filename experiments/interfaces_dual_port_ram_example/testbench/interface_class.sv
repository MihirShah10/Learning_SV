interface intf (input bit clk);

localparam DEPTH = 16;
localparam WIDTH = 8;
  
logic we;
logic re;
logic rst_n;
logic [$clog2(DEPTH)-1:0]w_addr;
logic [WIDTH-1:0]w_data;
logic [$clog2(DEPTH)-1:0]r_addr;
logic [WIDTH-1:0]r_data;
  
  modport ram(input we,re,rst_n,clk,w_addr,w_data,r_addr,
              output r_data);  
    
  modport ram_tb(output we,re,rst_n,clk,w_addr,w_data,r_addr,
              input r_data);
  
endinterface