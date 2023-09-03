//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_read_i2c_read_case_wr_rd_sequence.sv
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 31/07/23
// DESCRIPTION     : file contains virtual sequence  
//------------------------------------------------------------------------------------------------------------------//
class apb_read_i2c_read_case_wr_rd_sequence extends apb_2_i2c_virtual_seqs;

//factory registration
 `uvm_object_utils(apb_read_i2c_read_case_wr_rd_sequence);

//handle of sequence
  apb_read_i2c_read_case_rd_sequence rseqs_h;
  apb_read_i2c_read_case_wr_sequence wseqs_h;
//function new 
 function new(string name = "apb_read_i2c_read_case_wr_rd_sequence");
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
