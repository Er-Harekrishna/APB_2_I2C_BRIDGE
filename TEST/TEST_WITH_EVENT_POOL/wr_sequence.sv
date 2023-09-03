class wr_sequence extends uvm_sequence#(i2c_trans);

`uvm_object_utils(wr_sequence)
 
 i2c_trans req;
  
 function new(string name = "wr_sequence");
  super.new(name);
 endfunction

 task body();
  `uvm_info(get_type_name(), "Base seq: Inside Body of rd_sequece", UVM_LOW);
  repeat(9) begin
  `uvm_do_with(req,{req.mode == 1'b1;});
  end
 endtask

endclass
