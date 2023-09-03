//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_only_read_apb_sequence.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains sequence for write in dut using apb transcation 
//------------------------------------------------------------------------------------------------------------------//
class apb_only_read_apb_sequence extends uvm_sequence#(apb_trans);

`uvm_object_utils(apb_only_read_apb_sequence)
 
 apb_trans req;
  
 function new(string name = "apb_only_read_apb_sequence");
  super.new(name);
 endfunction

 task body();
  `uvm_info(get_type_name(), "Base seq: Inside Body", UVM_LOW);
  repeat(1) begin
  `uvm_do_with(req,{req.pwrite==1'b0;});
  end
 endtask

endclass

