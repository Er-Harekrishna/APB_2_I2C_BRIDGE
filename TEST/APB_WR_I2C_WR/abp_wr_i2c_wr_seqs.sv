//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_wr_i2c_wr_seqs.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the virtual sequence for starting the sequence on particular sequencer
//------------------------------------------------------------------------------------------------------------------//
class apb_wr_i2c_wr_seqs extends apb_2_i2c_virtual_seqs;

//factory registration
 `uvm_object_utils(apb_wr_i2c_wr_seqs);

//handle of sequence
  i2c_wr_sequence rseqs_h;
  apb_wr_sequence wseqs_h;
//function new 
 function new(string name = "apb_wr_i2c_wr_seqs");
  super.new(name);
 endfunction

//run phase
 task body();
  begin
   `uvm_do_on(wseqs_h,apb_seqr_h);
   `uvm_do_on(rseqs_h,i2c_seqr_h);
  end
 endtask
 
endclass

