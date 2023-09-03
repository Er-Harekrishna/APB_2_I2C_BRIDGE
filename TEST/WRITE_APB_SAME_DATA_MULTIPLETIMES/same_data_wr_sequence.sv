//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : same_data_wr_sequence.sv
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 31/07/23
// DESCRIPTION     : file contains write sequence 
//------------------------------------------------------------------------------------------------------------------//
class same_data_wr_sequence extends uvm_sequence#(apb_trans);

//factory registration
`uvm_object_utils(same_data_wr_sequence)
 
//transcation class handle
 apb_trans req;
  
//function new
 function new(string name = "same_data_wr_sequence");
  super.new(name);
 endfunction

//body task
 task body();
  `uvm_info(get_type_name(), "Base seq: Inside Body of write sequence", UVM_LOW);
  repeat(8) begin
  `uvm_do_with(req,{req.pwdata_in == 8'hba;});
  end
 endtask

endclass
