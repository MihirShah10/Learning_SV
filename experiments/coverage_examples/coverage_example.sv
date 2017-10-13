
/* 
Here we create bins with required elements to be covered and not the range.
If exact elements are sampled as in the bins, then that bin is covered. 
*/


program main; 
  bit [0:4] y; 
  bit [0:4] values[$]= '{11,24,26}; 

covergroup cg; 
cover_point_y : coverpoint y
  {
    bins low    = {0,11};
    bins med    = {12,24};
    bins high   = {25,31}; 
  }
endgroup

cg cg_inst = new(); 
initial 
foreach(values[i]) 
begin 
y = values[i]; 
cg_inst.sample(); 
end 

endprogram 



/* 
Here we Create 8 bins with 4 elements in each. These 8 bins are created automatically. 
If either one is the bin then that bin is covered completely 
*/

program main; 
  bit [0:4] y; 
  bit [0:4] values[$]= '{3,15,26}; 

covergroup cg; 
cover_point_y : coverpoint y 
  { option.auto_bin_max = 8 ; } 
endgroup 

cg cg_inst = new(); 
initial 
foreach(values[i]) 
begin 
y = values[i]; 
cg_inst.sample(); 
end 

endprogram 


/*Here we have 3 bins and if either element is sampled in the range of given coverage bin, then that bin is covered completely */

program main; 
  bit [0:4] y; 
  bit [0:4] values[$]= '{18,15,27}; 

covergroup cg; 
cover_point_y : coverpoint y
  {
    bins low    = {[0:11]};
    bins med    = {[12:24]};
    bins high   = {[25:31]}; 
  }
endgroup

cg cg_inst = new(); 
initial 
foreach(values[i]) 
begin 
y = values[i]; 
cg_inst.sample(); 
end 

endprogram
