//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_psel_high_all_transaction_case_test.sv
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 31/07/23
// DESCRIPTION     : file contains the test for psel high for all transaction 
//------------------------------------------------------------------------------------------------------------------//
class apb_psel_high_all_transaction_case_test extends apb_2_i2c_base_test;

 `uvm_component_utils(apb_psel_high_all_transaction_case_test)

 apb_psel_high_all_transaction_wr_rd_seqs vseqs_h;

 function new(string name = "apb_psel_high_all_transaction_case_test",uvm_component parent = null);
  super.new(name,parent);
  
   vseqs_h = apb_psel_high_all_transaction_wr_rd_seqs::type_id::create("vseqs_h");
 endfunction

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
