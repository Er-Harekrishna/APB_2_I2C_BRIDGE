//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : b2b_rw_reset_test.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the test for apb write upto depth and then
//                   reading it from i2c master upto depth   
//------------------------------------------------------------------------------------------------------------------//
class b2b_rw_reset_test extends apb_2_i2c_base_test;

//factory registration
 `uvm_component_utils(b2b_rw_reset_test)

//virtual sequence handle
// apb_wr_i2c_rd_till_depth_seqs vseqs_h;
 
 b2b_rw_reset_read_sequence i2c_rd_seqs;
 b2b_rw_reset_write_sequence apb_wr_seqs;
 
//function new
 function new(string name = "b2b_rw_reset_test",uvm_component parent = null);
  super.new(name,parent);
  // vseqs_h = apb_wr_i2c_rd_till_depth_seqs::type_id::create("vseqs_h");
 //  vseqs_h.vif_h = vif;
     i2c_rd_seqs = b2b_rw_reset_read_sequence::type_id::create("i2c_rd_seqs");
     apb_wr_seqs = b2b_rw_reset_write_sequence::type_id::create("apb_wr_seqs");
 endfunction

//run phase
 task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  begin
   apb_wr_seqs.start(env_h.apb_agnt_h.seqr_h);
   i2c_rd_seqs.start(env_h.i2c_agnt_h.seqr_h);

     #10; 
     vif.presetn = 0;
     #($urandom_range(2,4));
     vif.presetn = 1;

   i2c_rd_seqs.start(env_h.i2c_agnt_h.seqr_h);
 end
  phase.drop_objection(this);
 endtask

endclass
