//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : trans_no_wr_rd_test.sv
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 31/07/23
// DESCRIPTION     : 
//------------------------------------------------------------------------------------------------------------------//
class trans_no_wr_rd_test extends apb_2_i2c_base_test;

 `uvm_component_utils(trans_no_wr_rd_test)

 trans_no_wr_rd_sequence vseqs_h;

 function new(string name = "trans_no_wr_rd_test",uvm_component parent = null);
  super.new(name,parent);
  
   vseqs_h = trans_no_wr_rd_sequence::type_id::create("vseqs_h");
 endfunction

 task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  //wr_seq_h.start(env_h.apb_agnt_h.seqr_h);
  //rd_seq_h.start(env_h.i2c_agnt_h.seqr_h);
  vseqs_h.start(env_h.vseqr_h);
  phase.drop_objection(this);
 endtask

endclass
