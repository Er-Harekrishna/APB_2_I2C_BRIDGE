//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_pwdata_change_cb.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the user defined callback extended from the driver callback 
//                   for i2c stop condition implementation 
//------------------------------------------------------------------------------------------------------------------//

class apb_pwdata_change_cb extends apb_driver_callback;

//fafctory registration 
 `uvm_object_utils(apb_pwdata_change_cb)

//handle of virtual interface
  virtual apb_inf vif ;
 
//function new
 function new(string name = "apb_pwdata_change_cb");
  super.new(name);
 endfunction

 task pwdata_change_condition();
 vif.APB_WDR_MP.pwdata_in <= 8'ha3; 
 endtask

 task paddr_change_condition();
  vif.APB_WDR_MP.paddr <= 8'ha2; 
 endtask

endclass
