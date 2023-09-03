//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : wr_more_than_depth_case_wr_rd_test.sv
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 31/07/23
// DESCRIPTION     : file contains wr_more_than_depth_case_wr_rd test
//------------------------------------------------------------------------------------------------------------------//
class wr_more_than_depth_case_wr_rd_test extends apb_2_i2c_base_test;

 `uvm_component_utils(wr_more_than_depth_case_wr_rd_test)

 wr_more_than_depth_case_wr_rd_sequence vseqs_h;

 function new(string name = "wr_more_than_depth_case_wr_rd_test",uvm_component parent = null);
  super.new(name,parent);
  
   vseqs_h = wr_more_than_depth_case_wr_rd_sequence::type_id::create("vseqs_h");
 endfunction

 task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  vseqs_h.start(env_h.vseqr_h);
  phase.drop_objection(this);
 endtask

endclass
