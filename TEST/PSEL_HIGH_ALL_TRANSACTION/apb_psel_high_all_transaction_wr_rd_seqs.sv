//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_psel_high_all_transaction_wr_rd_seqs.sv
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 31/07/23
// DESCRIPTION     : file contains the virtuals sequence  
//------------------------------------------------------------------------------------------------------------------//
class apb_psel_high_all_transaction_wr_rd_seqs extends apb_2_i2c_virtual_seqs;

//factory registration
 `uvm_object_utils(apb_psel_high_all_transaction_wr_rd_seqs);

//handle of sequence
  apb_psel_high_all_transaction_rd_seqs rseqs_h;
  apb_psel_high_all_transaction_wr_seqs wseqs_h;
//function new 
 function new(string name = "apb_psel_high_all_transaction_wr_rd_seqs");
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
