//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_psel_high_all_transaction_wr_seqs.sv
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 31/07/23
// DESCRIPTION     : file contains the write sequence  
//------------------------------------------------------------------------------------------------------------------//
class apb_psel_high_all_transaction_wr_seqs extends uvm_sequence#(apb_trans);

`uvm_object_utils(apb_psel_high_all_transaction_wr_seqs)
 
 apb_trans req;
  
 function new(string name = "apb_psel_high_all_transaction_wr_seqs");
  super.new(name);
 endfunction

 task body();
  `uvm_info(get_type_name(), "Base seq: Inside Body of write sequence", UVM_LOW);
  repeat(8) begin
  `uvm_do_with(req,{req.psel_toggle == 1'b1;});
  end
 endtask

endclass
