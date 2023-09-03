//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_wr_i2c_rd_till_depth_seqs.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the virtual sequence for starting the sequence on particular sequencer
//------------------------------------------------------------------------------------------------------------------//
class apb_wr_i2c_rd_till_depth_seqs extends apb_2_i2c_virtual_seqs;

//factory registration
 `uvm_object_utils(apb_wr_i2c_rd_till_depth_seqs);

//virtual interface handle
//  virtual apb_inf vif_h;

//handle of sequence
  apb_wr_i2c_rd_till_depth_rd_sequence rseqs_h;
  apb_wr_i2c_rd_till_depth_wr_sequence wseqs_h;
//function new 
 function new(string name = "apb_wr_i2c_rd_till_depth_seqs");
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
