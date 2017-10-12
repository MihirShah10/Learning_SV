program dual_port_ram_test(intf.ram_tb ram_tb_inst);
 
  localparam DEPTH = 16;
  localparam WIDTH = 8;
  
  logic [WIDTH-1:0]data_recieved;  

initial begin
	// Reset the memory
    ram_tb_inst.rst_n <= 1;
    ram_tb_inst.we <= 0; 
    ram_tb_inst.re <= 0;
  	
    #10
    ram_tb_inst.rst_n <= 0; 
  		
  	// Writting the ram with write port active
  	for(int i=0; i<16;i++) begin
      #10 
      ram_tb_inst.we <= 1; 
      ram_tb_inst.w_data <= $urandom();
      ram_tb_inst.w_addr <= i;
    end
  	
    #20
    ram_tb_inst.we <= 0; // Done Writting
  	
  // Recieving data from ram through read port
  	for (int i=0; i <16; i++) begin
  	  #10 
      ram_tb_inst.re <= 1;
      ram_tb_inst.r_addr <= i; 
  	  
      #10 
      data_recieved = ram_tb_inst.r_data;
      
      $display("Address: 0x%x, Value: 0x%x, Time:%t ",
               ram_tb_inst.r_addr, data_recieved, $time);
    end
    #20 ram_tb_inst.re <= 0; //Done Reading
    $finish; 
    $stop;
end
endprogram 