//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : same_data_case_wr_rd_test.sv
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 31/07/23
// DESCRIPTION     : contains test file for the same data case 
//------------------------------------------------------------------------------------------------------------------//
class same_data_case_wr_rd_test extends apb_2_i2c_base_test;
//factory registration
 `uvm_component_utils(same_data_case_wr_rd_test)
//virtual sequence handle
 same_data_case_wr_rd_sequence vseqs_h;
//new function
 function new(string name = "same_data_case_wr_rd_test",uvm_component parent = null);
  super.new(name,parent);
  vseqs_h = same_data_case_wr_rd_sequence::type_id::create("vseqs_h");
 endfunction

//run_phase
 task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  //wr_seq_h.start(env_h.apb_agnt_h.seqr_h);
  //rd_seq_h.start(env_h.i2c_agnt_h.seqr_h);
  $display("in test run phase");

  if(env_h.vseqr_h == null)
    $display("env_h.vseqr_h nulll----------------");
  else 
    $display("env_h.vseqr_h NOT nulll----------------");
    
  vseqs_h.start(env_h.vseqr_h);
  $display("completion of sequence");
  phase.drop_objection(this);
 endtask

endclass
