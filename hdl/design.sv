module dual_port_ram(intf.ram ram_inst);
 
  localparam DEPTH = 16;
  localparam WIDTH = 8;
  localparam ADDR_BITS = $clog2(DEPTH);  
  
  logic [WIDTH-1:0]mem[DEPTH];
  
  always_ff @(posedge ram_inst.clk) 
  begin
    if(ram_inst.rst_n) ram_inst.r_data <= 0;
    else  begin
      //Write Port
      if(ram_inst.we) mem[ram_inst.w_addr] <= ram_inst.w_data;
      
      //Read Port
      if(ram_inst.re) 
        ram_inst.r_data <= mem[ram_inst.r_addr];
      else ram_inst.r_data <= 0;      
  	
    end
  end  
endmodule