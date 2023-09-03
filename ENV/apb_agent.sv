//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : abp_agent.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the code for apb agent 
//------------------------------------------------------------------------------------------------------------------//
class apb_agent extends uvm_agent;

`uvm_component_utils(apb_agent)

 apb_seqr seqr_h;
 apb_driver drv_h;
 apb_monitor mon_h;

 virtual apb_inf vif;

 function new(string name = "apb_agent",uvm_component parent);
  super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
 
  super.build_phase(phase);
 //building the comopents inside the 
  seqr_h = apb_seqr::type_id::create("seqr_h",this);
  drv_h  = apb_driver::type_id::create("drv_h",this);
  mon_h = apb_monitor::type_id::create("mon_h",this);

 //getting the virtual interface from the config_db
   if(!uvm_config_db#(virtual apb_inf)::get(this,"","vif",vif))
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

