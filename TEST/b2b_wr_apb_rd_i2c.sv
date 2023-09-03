class b2b_wr_apb_rd_i2c extends apb_2_i2c_virtual_seqs;

//factory registration
 `uvm_object_utils(b2b_wr_apb_rd_i2c);

//handle of sequence
  rd_sequence rseqs_h;
  wr_sequence wseqs_h;
//function new 
 function new(string name = "b2b_wr_apb_rd_i2c");
  super.new(name);
 endfunction

//body task
 task body();
  begin
   repeat(2)begin
   `uvm_do_on(wseqs_h,apb_seqr_h);
   `uvm_do_on(rseqs_h,i2c_seqr_h);
   end
  end
 endtask
 
endclass
