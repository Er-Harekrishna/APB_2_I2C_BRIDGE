//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : wr_more_than_depth_case_wr_sequence.sv
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 31/07/23
// DESCRIPTION     : file contains read sequence  
//------------------------------------------------------------------------------------------------------------------//
class semaphore_case_wr_sequence extends uvm_sequence#(apb_trans);

`uvm_object_utils(semaphore_case_wr_sequence)
 
 static semaphore sem = new(1);  
 
 apb_trans req;
  
 function new(string name = "semaphore_case_wr_sequence");
  super.new(name);
 endfunction

 task body();
  `uvm_info(get_type_name(), "Base seq: Inside Body of write sequence", UVM_LOW);
  repeat(9) begin
   sem.get(1);
   `uvm_do(req);
   sem.put(1);
  end
 endtask

endclass
