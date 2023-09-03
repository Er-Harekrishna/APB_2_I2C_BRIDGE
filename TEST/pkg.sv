//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : pkg.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 21/02/23
// DESCRIPTION     : 
//------------------------------------------------------------------------------------------------------------------//

//defines file
`include "apb_i2c_defines.sv"

//interfaces
`include "apb_inf.sv"
`include "i2c_inf.sv"

package pkg;

//importing packages from uvm_pkg 
 import uvm_pkg::*;
 `include "uvm_macros.svh"


//transaction class files
 `include "apb_trans.sv"
 `include "i2c_trans.sv"
///callback
`include "i2c_driver_callback.sv" 
`include "i2c_stop_condition_cb.sv" 

//apb callback
`include "apb_driver_callback.sv" 
`include "apb_pwdata_change_cb.sv"

//apb pready callback
 `include "apb_driver_pready_callback.sv"
 `include "apb_pready_cb.sv"

//noramal sequences
 `include "wr_sequence.sv"
 `include "rd_sequence.sv"

//sequencers
 `include "apb_seqr.sv"
 `include "i2c_seqr.sv"

//drivers 
 `include "apb_driver.sv"
 `include "i2c_driver.sv"
//monitor 
 `include "apb_monitor.sv"
 `include "i2c_monitor.sv"
 
//agents
 `include "i2c_agent.sv"
 `include "apb_agent.sv"
 
//virtual sequencer
 `include "apb_2_i2c_virtual_seqr.sv"
//virtual sequence
 `include "apb_2_i2c_virtual_seqs.sv"

 `include "apb_base_seqs.sv"
 `include "i2c_base_seqs.sv"

 
 `include "apb_2_i2c_sanity_seqs.sv"

 `include "wr_more_than_depth_case_wr_sequence.sv"
 `include "wr_more_than_depth_case_rd_sequence.sv"
 `include "wr_more_than_depth_case_wr_rd_sequence.sv"

 `include "semaphore_case_wr_sequence.sv" 
 `include "semaphore_case_rd_sequence.sv" 
 `include "semaphore_case_wr_rd_sequence.sv" 

 `include "b2b_wr_apb_rd_i2c.sv"

 `include "apb_base_wseqs.sv"
 `include "i2c_base_rseqs.sv"
 `include "i2c_data_rseqs.sv"
 `include "apb_data_wseqs.sv"

 `include "apb_wr_i2c_rd_till_depth_wr_sequence.sv"
 `include "apb_wr_i2c_rd_till_depth_rd_sequence.sv"
 `include "apb_wr_i2c_rd_till_depth_seqs.sv"


 `include "trans_no_wr_rd_sequence.sv"
 `include "apb_read_i2c_read_case_wr_sequence.sv"
 `include "apb_read_i2c_read_case_rd_sequence.sv"
 `include "apb_read_i2c_read_case_wr_rd_sequence.sv"

 `include "same_data_rd_sequence.sv"
 `include "same_data_wr_sequence.sv"
 `include "same_data_case_wr_rd_sequence.sv"

 `include "apb_psel_high_all_transaction_rd_seqs.sv"
 `include "apb_psel_high_all_transaction_wr_seqs.sv"
 `include "apb_psel_high_all_transaction_wr_rd_seqs.sv"
 
 `include "apb_psel_toggle_all_transaction_wr_seqs.sv"
 `include "apb_psel_toggle_all_transaction_rd_seqs.sv"
 `include "apb_psel_toggle_all_transaction_wr_rd_seqs.sv"

 `include "apb_only_read_i2c_sequence.sv"
 `include "apb_only_read_apb_sequence.sv"
 `include "apb_only_read_seqs.sv"

 `include "i2c_wr_sequence.sv"
 `include "apb_wr_sequence.sv"
 `include "abp_wr_i2c_wr_seqs.sv"

 `include "reset_on_the_fly_rd_sequence.sv"
 `include "reset_on_the_fly_wr_sequence.sv"
 `include "reset_on_the_fly_vseqs.sv"

 `include "apb_wr_rst_i2c_rd_read_sequence.sv" 
 `include "apb_wr_rst_i2c_rd_write_sequence.sv" 

 `include "b2b_rw_reset_read_sequence.sv"
 `include "b2b_rw_reset_write_sequence.sv"
  
//scoreboard 
 `include "scoreboard.sv"
 
//subscriber
 `include "apb_2_i2c_coverage.sv"

//environment
 `include "apb_i2c_env.sv"
//basetest 
 `include "apb_2_i2c_base_test.sv"
 
//test cases
 `include "sanity_test.sv"
 `include "b2b_wr_apb_rd_i2c_test.sv"
 `include "wr_more_than_depth_case_wr_rd_test.sv"
 `include "trans_no_wr_rd_test.sv"
 `include "i2c_stop_cond_cb_test.sv"
 `include "semaphore_case_wr_rd_test.sv"
 `include "apb_read_i2c_read_case_wr_rd_test.sv"
 `include "same_data_case_wr_rd_test.sv"
 `include "apb_psel_high_all_transaction_case_test.sv"
 `include "apb_psel_toggle_all_transaction_case_test.sv"
 `include "apb_only_read_test.sv" 
 `include "apb_wr_i2c_rd_till_depth_test.sv"
 `include "apb_wr_i2c_wr_test.sv"
 `include "reset_on_the_fly_test.sv"
 `include "apb_pwdata_change_cb_test.sv"
 `include "apb_pready_cb_test.sv"
 `include "apb_wr_rst_i2c_rd_test.sv"
 `include "b2b_rw_reset_test.sv"
 
endpackage 
