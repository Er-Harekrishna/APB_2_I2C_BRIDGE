//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_wr_i2c_wr_test.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : 
//------------------------------------------------------------------------------------------------------------------//
class apb_wr_i2c_wr_test extends apb_2_i2c_base_test;

 `uvm_component_utils(apb_wr_i2c_wr_test)

 apb_wr_i2c_wr_seqs vseqs_h;

 function new(string name = "apb_wr_i2c_wr_test",uvm_component parent = null);
  super.new(name,parent);
   vseqs_h = apb_wr_i2c_wr_seqs::type_id::create("vseqs_h");
 endfunction

 task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  vseqs_h.start(env_h.vseqr_h);
  $display("completion of sequence");
  phase.drop_objection(this);
 endtask

endclass
