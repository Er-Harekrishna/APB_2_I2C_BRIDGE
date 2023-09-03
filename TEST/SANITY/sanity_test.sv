//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_to_i2c_test.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : 
//------------------------------------------------------------------------------------------------------------------//
class sanity_test extends apb_2_i2c_base_test;

 `uvm_component_utils(sanity_test)

 apb_2_i2c_sanity_seqs vseqs_h;

 function new(string name = "sanity_test",uvm_component parent = null);
  super.new(name,parent);
   vseqs_h = apb_2_i2c_sanity_seqs::type_id::create("vseqs_h");
 endfunction

 task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  vseqs_h.start(env_h.vseqr_h);
  phase.drop_objection(this);
 endtask

endclass



 
