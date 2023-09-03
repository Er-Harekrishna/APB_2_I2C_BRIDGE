//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_to_i2c_test.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains sequence for read from  dut using i2c transcation 
//------------------------------------------------------------------------------------------------------------------//
class rd_sequence extends uvm_sequence#(i2c_trans);

`uvm_object_utils(rd_sequence)
 
 i2c_trans req;
  
 function new(string name = "rd_sequence");
  super.new(name);
 endfunction

 task body();
  `uvm_info(get_type_name(), "Base seq: Inside Body", UVM_LOW);
  repeat(1) begin
  `uvm_do_with(req,{req.mode == 1'b1;});
  end
 endtask

endclass
