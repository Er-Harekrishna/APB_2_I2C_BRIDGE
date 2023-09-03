 //------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : b2b_wr_apb_rd_i2c_test.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : 
//------------------------------------------------------------------------------------------------------------------//
class b2b_wr_apb_rd_i2c_test extends apb_2_i2c_base_test;

 `uvm_component_utils(b2b_wr_apb_rd_i2c_test)

 //apb_i2c_env env_h;
// wr_sequence wr_seq_h;
// rd_sequence rd_seq_h;

 b2b_wr_apb_rd_i2c vseqs_h;

 function new(string name = "sanity_test",uvm_component parent = null);
  super.new(name,parent);
  
   vseqs_h = b2b_wr_apb_rd_i2c::type_id::create("vseqs_h");
  //env_h = apb_i2c_env::type_id::create("env_h",this);
  //wr_seq_h = wr_sequence::type_id::create("wr_seq_h",this);
  //rd_seq_h = rd_sequence::type_id::create("rd_seq_h",this);
 endfunction

 task run_phase(uvm_phase phase);
  phase.raise_objection(this);
   vseqs_h.start(env_h.vseqr_h);
  phase.drop_objection(this);
 endtask

endclass

