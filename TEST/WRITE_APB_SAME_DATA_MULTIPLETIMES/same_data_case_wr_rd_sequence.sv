//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : same_data_case_wr_rd_sequence.sv
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 31/07/23
// DESCRIPTION     : file contains virtual sequence for same_data_case_wr_rd test 
//------------------------------------------------------------------------------------------------------------------//
class same_data_case_wr_rd_sequence extends apb_2_i2c_virtual_seqs;

//factory registration
 `uvm_object_utils(same_data_case_wr_rd_sequence);

//handle of sequence
  same_data_rd_sequence rseqs_h;
  same_data_wr_sequence wseqs_h;
//function new 
 function new(string name = "same_data_case_wr_rd_sequence");
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
