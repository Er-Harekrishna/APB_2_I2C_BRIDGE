//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : i2c_agent.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the agent of i2c master containing monitor,driver and sequencer
//------------------------------------------------------------------------------------------------------------------//

class i2c_agent extends uvm_agent;

 `uvm_component_utils(i2c_agent)
 
//components instantiation
 i2c_seqr seqr_h;
 i2c_driver drv_h;
 i2c_monitor mon_h;

//virtual interface instantiation 
 virtual i2c_inf vif;

//function new  
 function new(string name = "i2c_agent",uvm_component parent = null);
  super.new(name,parent);
 endfunction

//build phase consisting of creation of components in agent
 function void build_phase(uvm_phase phase);
 
  super.build_phase(phase);
 //building the comopents inside the 
  seqr_h = i2c_seqr::type_id::create("seqr_h",this);
  drv_h  = i2c_driver::type_id::create("drv_h",this);
  mon_h = i2c_monitor::type_id::create("mon_h",this);

 //getting the virtual interface from the config_db
   if(!uvm_config_db#(virtual i2c_inf)::get(this,"","vif",vif))
         `uvm_fatal("APB_AGENT","Not able to get the virtual interface");

 endfunction

  function void connect_phase(uvm_phase phase);
  
//connection between sequencer and driver
  drv_h.seq_item_port.connect(seqr_h.seq_item_export);
  
//connecting the virtual interfaces of write driver and monitor
  drv_h.vif = vif;
  mon_h.vif = vif;
 endfunction
 
endclass 
 
