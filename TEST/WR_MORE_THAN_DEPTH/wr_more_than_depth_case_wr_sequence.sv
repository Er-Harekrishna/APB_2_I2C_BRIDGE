//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : wr_more_than_depth_case_wr_sequence.sv
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 31/07/23
// DESCRIPTION     : file contains write sequence  
//------------------------------------------------------------------------------------------------------------------//
class wr_more_than_depth_case_wr_sequence extends uvm_sequence#(apb_trans);

`uvm_object_utils(wr_more_than_depth_case_wr_sequence)
 
 apb_trans req;
  
 function new(string name = "wr_more_than_depth_case_wr_sequence");
  super.new(name);
 endfunction

 task body();
  `uvm_info(get_type_name(), "Base seq: Inside Body of write sequence", UVM_LOW);
  repeat(25) begin
  `uvm_do(req);
  end
 endtask

endclass
