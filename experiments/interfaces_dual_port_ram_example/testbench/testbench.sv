`include "interface_class.sv"
`include "test_logic.sv"

module test_top;
  bit clk = 0;
  
  always #5 clk=~clk; 
  
  intf intf_inst(clk);
  dual_port_ram_test u_ram_tb(intf_inst);
  dual_port_ram      u_ram(intf_inst);
  
endmodule