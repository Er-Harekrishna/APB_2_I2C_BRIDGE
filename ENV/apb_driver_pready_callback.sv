//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_driver_pready_callback.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the i2c driver callback  
//------------------------------------------------------------------------------------------------------------------//
class apb_driver_pready_callback extends uvm_callback;
  
 //factory registration
 `uvm_object_utils(apb_driver_pready_callback)

 function new(string name = "apb_driver_pready_callback");
  super.new(name);
 endfunction

 virtual task pready_callback();
 endtask   

endclass
