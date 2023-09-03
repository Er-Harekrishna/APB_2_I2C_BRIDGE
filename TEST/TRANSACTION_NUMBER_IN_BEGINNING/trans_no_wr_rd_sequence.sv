//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : trans_no_wr_rd_sequence.sv
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 31/07/23
// DESCRIPTION     : 
//------------------------------------------------------------------------------------------------------------------//
class trans_no_wr_rd_sequence extends apb_2_i2c_virtual_seqs;

//factory registration
 `uvm_object_utils(trans_no_wr_rd_sequence);

//handle of sequence
  i2c_data_rseqs rseqs_h;
  apb_data_wseqs wseqs_h;
//function new 
 function new(string name = "trans_no_wr_rd_sequence");
  super.new(name);
 endfunction

//run phase
 task body();
  begin
   `uvm_do_on_with(wseqs_h,apb_seqr_h,{no_of_trans == 3;});
   `uvm_do_on_with(rseqs_h,i2c_seqr_h,{no_of_trans == 2;});
  end
 endtask
 
endclass
