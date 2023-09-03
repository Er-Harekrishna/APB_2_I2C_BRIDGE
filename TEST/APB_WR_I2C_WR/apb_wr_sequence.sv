//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_wr_sequence.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains sequence for write in dut using apb transcation 
//------------------------------------------------------------------------------------------------------------------//
class apb_wr_sequence extends uvm_sequence#(apb_trans);

`uvm_object_utils(apb_wr_sequence)
 
 apb_trans req;
  
 function new(string name = "apb_wr_sequence");
  super.new(name);
 endfunction

 task body();
  `uvm_info(get_type_name(), "Base seq: Inside Body", UVM_LOW);
  repeat(1) begin
  `uvm_do_with(req,{req.pwrite==1'b1;});
  end
 endtask

endclass
