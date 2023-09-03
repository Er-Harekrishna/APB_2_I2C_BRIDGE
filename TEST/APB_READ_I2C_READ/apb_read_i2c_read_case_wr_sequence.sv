//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_read_i2c_read_case_wr_sequence.sv
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 31/07/23
// DESCRIPTION     : file contains read sequence 
//------------------------------------------------------------------------------------------------------------------//
class apb_read_i2c_read_case_wr_sequence extends uvm_sequence#(apb_trans);

`uvm_object_utils(apb_read_i2c_read_case_wr_sequence)
 
 apb_trans req;
  
 function new(string name = "apb_read_i2c_read_case_wr_sequence");
  super.new(name);
 endfunction

 task body();
  `uvm_info(get_type_name(), "Base seq: Inside Body of write sequence", UVM_LOW);
  repeat(9) begin
  `uvm_do_with(req,{req.pwrite == 1'b0;});
  end
 endtask

endclass
