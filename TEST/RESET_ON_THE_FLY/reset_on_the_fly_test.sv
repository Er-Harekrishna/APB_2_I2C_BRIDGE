//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : reset_on_the_fly_test.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the test for apb write upto depth and then
//                   reading it from i2c master upto depth   
//------------------------------------------------------------------------------------------------------------------//
class reset_on_the_fly_test extends apb_2_i2c_base_test;

//factory registration
 `uvm_component_utils(reset_on_the_fly_test)

//virtual sequence handle
 reset_on_the_fly_vseqs vseqs_h;

//function new
 function new(string name = "reset_on_the_fly_test",uvm_component parent = null);
  super.new(name,parent);
   vseqs_h = reset_on_the_fly_vseqs::type_id::create("vseqs_h");
 //  vseqs_h.vif_h = vif;
 endfunction

//run phase
 task run_phase(uvm_phase phase);
  phase.raise_objection(this);
 fork
   begin
    vseqs_h.start(env_h.vseqr_h);
   end
   begin
    repeat(4) begin
     vif.presetn = 0;
     #($urandom_range(2,4));
     vif.presetn = 1;
     #($urandom_range(200,400));
    end
   end
  join
 
  phase.drop_objection(this);
 endtask

endclass
