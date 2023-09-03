//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_to_i2c_test.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the callback case test for apb2i2c stop condition 
//------------------------------------------------------------------------------------------------------------------//
class i2c_stop_cond_cb_test extends apb_2_i2c_base_test;

 //factory registration
 `uvm_component_utils(i2c_stop_cond_cb_test)

//virtual sequence handle
 apb_2_i2c_sanity_seqs vseqs_h;

//virtual intarface handle
 virtual i2c_inf vif ;
 
//callback
 i2c_stop_condition_cb err_callback;

//function new
 function new(string name = "i2c_stop_cond_cb_test",uvm_component parent = null);
  super.new(name,parent);
   vseqs_h = apb_2_i2c_sanity_seqs::type_id::create("vseqs_h");
 endfunction

//build phase
function void build_phase(uvm_phase phase);
 super.build_phase(phase);
  
 err_callback = i2c_stop_condition_cb::type_id::create("err_callback",this);
 
  if(!uvm_config_db#(virtual i2c_inf)::get(this,"","vif",vif))
         `uvm_fatal("APB_AGENT","Not able to get the virtual interface");

 endfunction

//connect phase
 function void connect_phase(uvm_phase phase);
  err_callback.vif = vif;
 endfunction

 task run_phase(uvm_phase phase);
  phase.raise_objection(this);
   uvm_callbacks#(i2c_driver,i2c_driver_callback)::add(env_h.i2c_agnt_h.drv_h,err_callback);
   vseqs_h.start(env_h.vseqr_h);
  phase.phase_done.set_drain_time(this,1000ns);
  phase.drop_objection(this);
 endtask

endclass

