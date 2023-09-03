class wr_directed_data_seqs extends uvm_sequence#(apb_trans);

`uvm_object_utils(wr_directed_seqs)
 
 apb_trans req;
  
 function new(string name = "wr_sequence");
  super.new(name);
 endfunction

 task body();
  `uvm_info(get_type_name(), "Base seq: Inside Body", UVM_LOW);
  repeat(10) begin
  `uvm_do_with(req,{req.pwdata_in == 8'hba;});
  end
 endtask

endclass

