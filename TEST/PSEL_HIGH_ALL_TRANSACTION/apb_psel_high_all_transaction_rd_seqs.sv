//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_psel_high_all_transaction_rd_seqs.sv
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 31/07/23
// DESCRIPTION     : file contains the read sequence  
//------------------------------------------------------------------------------------------------------------------//
class apb_psel_high_all_transaction_rd_seqs extends uvm_sequence#(i2c_trans);

//factory registration
`uvm_object_utils(apb_psel_high_all_transaction_rd_seqs)
 
//transaction class handle
 i2c_trans req;
  
//function new
 function new(string name = "apb_psel_high_all_transaction_rd_seqs");
  super.new(name);
 endfunction

//body task 
 task body();
  `uvm_info(get_type_name(), "Base seq: Inside Body of rd_sequece", UVM_LOW);
  repeat(8) begin
  `uvm_do_with(req,{req.mode == 1'b1;});
  end
 endtask

endclass

