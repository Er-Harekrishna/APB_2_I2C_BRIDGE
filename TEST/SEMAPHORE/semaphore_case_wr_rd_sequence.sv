//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : wr_more_than_depth_case_wr_rd_sequence.sv
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 31/07/23
// DESCRIPTION     : file contains virtual sequence  
//------------------------------------------------------------------------------------------------------------------//
class semaphore_case_wr_rd_sequence extends apb_2_i2c_virtual_seqs;

//factory registration
 `uvm_object_utils(semaphore_case_wr_rd_sequence);

//handle of sequence
  semaphore_case_rd_sequence rseqs_h;
  semaphore_case_wr_sequence wseqs_h;
//function new 
 function new(string name = "semaphore_case_wr_rd_sequence");
  super.new(name);
 endfunction

//run phase
 task body();
  fork
   begin
     wseqs_h = semaphore_case_wr_sequence::type_id::create("wseqs_h");
     wseqs_h.start(apb_seqr_h);
   end
   begin
     rseqs_h = semaphore_case_rd_sequence::type_id::create("rseqs_h");
     rseqs_h.start(i2c_seqr_h);
   end
  join
 endtask
 
endclass
