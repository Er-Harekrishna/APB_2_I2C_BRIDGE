//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : b2b_rw_reset_write_sequence.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains sequence for write in dut using apb transcation 
//------------------------------------------------------------------------------------------------------------------//
class b2b_rw_reset_write_sequence extends apb_base_seqs;

`uvm_object_utils(b2b_rw_reset_write_sequence)
 
  
 function new(string name = "b2b_rw_reset_write_sequence");
  super.new(name);
 endfunction

 task body();
  `uvm_info(get_type_name(), "Base seq: Inside Body", UVM_LOW);
  repeat(8) begin
  `uvm_do(trans_h);
  end
 endtask

endclass
