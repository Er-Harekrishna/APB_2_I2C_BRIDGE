//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_wr_i2c_rd_till_depth_test.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the test for apb write upto depth and then
//                   reading it from i2c master upto depth   
//------------------------------------------------------------------------------------------------------------------//
class apb_wr_i2c_rd_till_depth_test extends apb_2_i2c_base_test;

//factory registration
 `uvm_component_utils(apb_wr_i2c_rd_till_depth_test)

//virtual sequence handle
 apb_wr_i2c_rd_till_depth_seqs vseqs_h;

//function new
 function new(string name = "apb_wr_i2c_rd_till_depth_test",uvm_component parent = null);
  super.new(name,parent);
   vseqs_h = apb_wr_i2c_rd_till_depth_seqs::type_id::create("vseqs_h");
 //  vseqs_h.vif_h = vif;
 endfunction

//run phase
 task run_phase(uvm_phase phase);
  phase.raise_objection(this);
    vseqs_h.start(env_h.vseqr_h);
  phase.drop_objection(this);
 endtask

endclass
