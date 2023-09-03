class i2c_data_rseqs extends i2c_base_rseqs;

   `uvm_object_utils(i2c_data_rseqs)

    function new (string name = "i2c_data_rseqs");
       super.new(name);
    endfunction
 
    task body();
     repeat(no_of_trans) begin
      `uvm_do(trans_h);
     // `uvm_do()
     // trans_h=ram_wtrans::type_id::create("trans_h");
      //start_item(trans_h);
      //assert(trans_h.randomize() with {wr_data > 150;});
      //finish_item(trans_h);
     end
    endtask

endclass
