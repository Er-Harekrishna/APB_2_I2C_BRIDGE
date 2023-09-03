//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_psel_toggle_all_transaction_wr_seqs.sv
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 31/07/23
// DESCRIPTION     : file contains the write sequence  
//------------------------------------------------------------------------------------------------------------------//
class apb_psel_toggle_all_transaction_wr_seqs extends uvm_sequence#(apb_trans);
 
`uvm_object_utils(apb_psel_toggle_all_transaction_wr_seqs)
 
 apb_trans req;
 
// bit i;
 
 function new(string name = "apb_psel_toggle_all_transaction_wr_seqs");
  super.new(name);
 endfunction

 task body();
  bit i=0;
  `uvm_info(get_type_name(), "Base seq: Inside Body of write sequence", UVM_LOW);
  repeat(8) begin
  
  if(i==0)begin 
     i=1;
     `uvm_do_with(req,{req.psel_toggle == 1'b0;});
     end
  else begin
   i=0;
   `uvm_do_with(req,{req.psel_toggle == 1'b1;});
  end
 
  end
 endtask

endclass
