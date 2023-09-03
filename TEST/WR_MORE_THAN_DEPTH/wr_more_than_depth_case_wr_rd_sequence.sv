//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : wr_more_than_depth_case_wr_rd_sequence.sv
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 31/07/23
// DESCRIPTION     : file contains virtual sequence for write more than depth case   
//------------------------------------------------------------------------------------------------------------------//
class wr_more_than_depth_case_wr_rd_sequence extends apb_2_i2c_virtual_seqs;

//factory registration
 `uvm_object_utils(wr_more_than_depth_case_wr_rd_sequence);

//handle of sequence
  wr_more_than_depth_case_rd_sequence rseqs_h;
  wr_more_than_depth_case_wr_sequence wseqs_h;
//function new 
 function new(string name = "wr_more_than_depth_case_wr_rd_sequence");
  super.new(name);
 endfunction

//body task 
 task body();
  fork 
   `uvm_do_on(wseqs_h,apb_seqr_h);
   `uvm_do_on(rseqs_h,i2c_seqr_h);
  join
 endtask
 
endclass
