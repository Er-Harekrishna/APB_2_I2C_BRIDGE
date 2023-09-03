//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : reset_on_the_fly_rd_sequence.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains sequence for read from  dut using i2c transcation 
//------------------------------------------------------------------------------------------------------------------//
class reset_on_the_fly_rd_sequence extends i2c_base_seqs;

//factory registration
`uvm_object_utils(reset_on_the_fly_rd_sequence)
 
//function new
 function new(string name = "reset_on_the_fly_rd_sequence");
  super.new(name);
 endfunction

//body task to start the sequence 
 task body();
  `uvm_info(get_type_name(), "Base seq: Inside Body", UVM_LOW);
  repeat(num_of_trans) begin
  `uvm_do_with(trans_h,{trans_h.mode == 1'b1;});
  end
 endtask

endclass
