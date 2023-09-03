//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_wr_rst_i2c_rd_write_sequence.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains sequence for write in dut using apb transcation 
//------------------------------------------------------------------------------------------------------------------//
class apb_wr_rst_i2c_rd_write_sequence extends apb_base_seqs;

`uvm_object_utils(apb_wr_rst_i2c_rd_write_sequence)
 
  
 function new(string name = "apb_wr_rst_i2c_rd_write_sequence");
  super.new(name);
 endfunction

 task body();
  `uvm_info(get_type_name(), "Base seq: Inside Body", UVM_LOW);
  repeat(8) begin
  `uvm_do(trans_h);
  end
 endtask

endclass
