class directed_1_sequence extends apb_2_i2c_virtual_seqs;

//factory registration
 `uvm_object_utils(directed_1_sequence);

//handle of sequence
  rd_sequence rseqs_h;
  wr_sequence wseqs_h;
//function new 
 function new(string name = "directed_1_sequence");
  super.new(name);
 endfunction

//run phase
 task body();
  begin
   `uvm_do_on(wseqs_h,apb_seqr_h);
   `uvm_do_on(rseqs_h,i2c_seqr_h);
  end
 endtask
 
endclass


