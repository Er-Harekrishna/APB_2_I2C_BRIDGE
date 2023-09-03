//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_monitor.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the monitor for the apb master to monitor the
//                   information getting from dut and passing it to scoreboard for comparison  
//------------------------------------------------------------------------------------------------------------------//
`define MON_INF vif.APB_MON_MP
class apb_monitor extends uvm_monitor;

 //factory registration
 `uvm_component_utils(apb_monitor);
 
//transaction class handle
 apb_trans trans;
 
//virtual interface handle 
  virtual apb_inf.APB_MON_MP vif;
 
 //TLM analysis port
   uvm_analysis_port #(apb_trans) write_a_port; 

//function new
 function new(string name = "apb_monitor" , uvm_component parent = null);
  super.new(name,parent);
  write_a_port = new("write_a_port",this);
 endfunction

 //run_phase task for 
 task run_phase(uvm_phase phase);
   
  `uvm_info(get_type_name(),"in run phase of apb_monitor",UVM_NONE)
  //waiting for reset
  wait(vif.APB_MON_MP.presetn);
  `uvm_info(get_type_name(),"in run phase of apb_monitor after wait for reset",UVM_NONE)

  forever begin
   monitor(trans);
  end
 endtask

//task for taking information from dut through interface
 task monitor(apb_trans req);
      
     @(posedge vif.clk);
   //  #1; 
     if((`MON_INF.psel)&&(`MON_INF.penable)&&(`MON_INF.pready)&&(`MON_INF.pwrite)) begin
      req = apb_trans::type_id::create("req",this); 
      req.pwrite = `MON_INF.pwrite;
      req.paddr  = `MON_INF.paddr;
      req.pwdata_in = `MON_INF.pwdata_in;
      req.pwrite = `MON_INF.pwrite;
       //req.print(); 
      `uvm_info(get_type_name(),$sformatf("[FROM RD_MON] write=%0h paddr=%0h   pwdata_in=%0h",req.pwrite,req.paddr,req.pwdata_in),UVM_NONE)
      write_a_port.write(req);
      `uvm_info(get_type_name(),$sformatf("data send from monitor"),UVM_NONE)
     end 
 endtask

endclass


 

 
