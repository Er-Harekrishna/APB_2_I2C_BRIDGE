//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_only_read_i2c_sequence.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains sequence for read from  dut using i2c transcation 
//------------------------------------------------------------------------------------------------------------------//
class apb_only_read_i2c_sequence extends uvm_sequence#(i2c_trans);

`uvm_object_utils(apb_only_read_i2c_sequence)
 
 i2c_trans req;
  
 function new(string name = "apb_only_read_i2c_sequence");
  super.new(name);
 endfunction

 task body();
  `uvm_info(get_type_name(), "Base seq: Inside Body", UVM_LOW);
  repeat(1) begin
  `uvm_do_with(req,{req.mode == 1'b1;});
  end
 endtask

endclass
