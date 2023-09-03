//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : reset_on_the_fly_vseqs.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the virtual sequence for starting the sequence on particular sequencer
//------------------------------------------------------------------------------------------------------------------//
class reset_on_the_fly_vseqs extends apb_2_i2c_virtual_seqs;

//factory registration
 `uvm_object_utils(reset_on_the_fly_vseqs);

//virtual interface handle
//  virtual apb_inf vif_h;

//handle of sequence
  reset_on_the_fly_rd_sequence rseqs_h;
  reset_on_the_fly_wr_sequence wseqs_h;
//function new 
 function new(string name = "reset_on_the_fly_vseqs");
  super.new(name);
 endfunction

//run phase
 task body();
  begin
   `uvm_do_on_with(wseqs_h,apb_seqr_h,{num_of_trans == 8;});
   `uvm_do_on_with(rseqs_h,i2c_seqr_h,{num_of_trans == 8;});
  end
 endtask
 
endclass
