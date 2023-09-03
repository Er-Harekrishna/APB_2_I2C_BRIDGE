//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : same_data_rd_sequence.sv
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 31/07/23
// DESCRIPTION     : file contains read sequence  
//------------------------------------------------------------------------------------------------------------------//
class same_data_rd_sequence extends uvm_sequence#(i2c_trans);

//factory registration
`uvm_object_utils(same_data_rd_sequence)
 
//transcation class handle
 i2c_trans req;
  
//function new
 function new(string name = "same_data_rd_sequence");
  super.new(name);
 endfunction

//body task to start the with the sequence  
 task body();
  `uvm_info(get_type_name(), "Base seq: Inside Body of rd_sequece", UVM_LOW);
  repeat(8) begin
  `uvm_do_with(req,{req.mode == 1'b1;});
  end
 endtask

endclass

