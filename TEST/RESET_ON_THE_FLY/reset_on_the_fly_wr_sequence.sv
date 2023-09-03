//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : reset_on_the_fly_wr_sequence.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains sequence for write in dut using apb transcation 
//------------------------------------------------------------------------------------------------------------------//
class reset_on_the_fly_wr_sequence extends apb_base_seqs;

`uvm_object_utils(reset_on_the_fly_wr_sequence)
 
  
 function new(string name = "reset_on_the_fly_wr_sequence");
  super.new(name);
 endfunction

 task body();
  `uvm_info(get_type_name(), "Base seq: Inside Body", UVM_LOW);
  repeat(num_of_trans) begin
  `uvm_do(trans_h);
  end
 endtask

endclass
