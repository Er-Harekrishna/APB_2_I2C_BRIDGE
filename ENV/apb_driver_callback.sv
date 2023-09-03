//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_driver_callback.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the i2c driver callback  
//------------------------------------------------------------------------------------------------------------------//
class apb_driver_callback extends uvm_callback;
  
 //factory registration
 `uvm_object_utils(apb_driver_callback)

 function new(string name = "apb_driver_callback");
  super.new(name);
 endfunction

 virtual task pwdata_change_condition();
 endtask

 virtual task paddr_change_condition();
 endtask

endclass
