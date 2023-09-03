//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_read_i2c_read_case_rd_sequence.sv
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 31/07/23
// DESCRIPTION     : file contains read sequence  
//------------------------------------------------------------------------------------------------------------------//
class apb_read_i2c_read_case_rd_sequence extends uvm_sequence#(i2c_trans);

`uvm_object_utils(apb_read_i2c_read_case_rd_sequence)
 
 i2c_trans req;
  
 function new(string name = "apb_read_i2c_read_case_rd_sequence");
  super.new(name);
 endfunction

 task body();
  `uvm_info(get_type_name(), "Base seq: Inside Body of rd_sequece", UVM_LOW);
  repeat(9) begin
  `uvm_do_with(req,{req.mode == 1'b1;});
  end
 endtask

endclass

