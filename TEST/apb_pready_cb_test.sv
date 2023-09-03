//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_pready_cb_test.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the callback case test for apb2i2c stop condition 
//------------------------------------------------------------------------------------------------------------------//
class apb_pready_cb_test extends apb_2_i2c_base_test;

 //factory registration
 `uvm_component_utils(apb_pready_cb_test)

//virtual sequence handle
 apb_2_i2c_sanity_seqs vseqs_h;

//virtual intarface handle
 virtual apb_inf vif ;
 
//callback
 apb_pready_cb err_callback;

//function new
 function new(string name = "apb_pwdata_change_cb_test",uvm_component parent = null);
  super.new(name,parent);
   vseqs_h = apb_2_i2c_sanity_seqs::type_id::create("vseqs_h");
 endfunction

//build phase
function void build_phase(uvm_phase phase);
 super.build_phase(phase);
  err_callback = apb_pready_cb::type_id::create("err_callback",this);

  if(!uvm_config_db#(virtual apb_inf)::get(this,"","vif",vif))
         `uvm_fatal("APB_AGENT","Not able to get the virtual interface");

 endfunction

//connect phase
 function void connect_phase(uvm_phase phase);
  err_callback.vif = vif;
 endfunction

//run phase
 task run_phase(uvm_phase phase);
  phase.raise_objection(this);
   uvm_callbacks#(apb_driver,apb_driver_callback)::add(env_h.apb_agnt_h.drv_h,err_callback);//adding call back 
   vseqs_h.start(env_h.vseqr_h);
   phase.phase_done.set_drain_time(this,1000ns);
  phase.drop_objection(this);
 endtask

endclass
