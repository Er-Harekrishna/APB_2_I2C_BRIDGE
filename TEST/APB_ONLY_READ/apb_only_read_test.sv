//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_only_read_test.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : 
//------------------------------------------------------------------------------------------------------------------//
class apb_only_read_test extends apb_2_i2c_base_test;

 `uvm_component_utils(apb_only_read_test)

 apb_only_read_seqs vseqs_h;

 function new(string name = "apb_only_read_test",uvm_component parent = null);
  super.new(name,parent);
   vseqs_h = apb_only_read_seqs::type_id::create("vseqs_h");
 endfunction

 task run_phase(uvm_phase phase);
  phase.raise_objection(this);
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



 
