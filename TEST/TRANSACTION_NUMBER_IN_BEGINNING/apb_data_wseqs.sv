class apb_data_wseqs extends apb_base_wseqs;

   `uvm_object_utils(apb_data_wseqs)

    function new (string name = "apb_data_wseqs");
       super.new(name);
    endfunction
 
    task body();
     repeat(no_of_trans) begin
      `uvm_do(trans_h);
     // `uvm_do();
     // trans_h=ram_wtrans::type_id::create("trans_h");
      //start_item(trans_h);
      //assert(trans_h.randomize() with {wr_data > 150;});
      //finish_item(trans_h);
     end
    endtask

endclass
