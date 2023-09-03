//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_only_read_seqs.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the virtual sequence for starting the sequence on particular sequencer
//------------------------------------------------------------------------------------------------------------------//
class apb_only_read_seqs extends apb_2_i2c_virtual_seqs;

//factory registration
 `uvm_object_utils(apb_only_read_seqs);

//handle of sequence
  apb_only_read_i2c_sequence rseqs_h;
  apb_only_read_apb_sequence wseqs_h;
//function new 
 function new(string name = "apb_2_i2c_sanity_seqs");
  super.new(name);
 endfunction

//run phase
 task body();
  begin
   if(apb_seqr_h == null)
     $display("apb null------------------------------------");
   else 
     $display("abp not null ----------------------------------");
   
   if(i2c_seqr_h == null) 
     $display("i2c null------------------------------------");
   else 
     $display("i2c not  null ----------------------------------");
   
   `uvm_do_on(wseqs_h,apb_seqr_h);
   `uvm_do_on(rseqs_h,i2c_seqr_h);
  end
 endtask
 
endclass


 

