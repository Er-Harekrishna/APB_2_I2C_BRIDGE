//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : i2c_driver_callback.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the i2c driver callback  
//------------------------------------------------------------------------------------------------------------------//
class i2c_driver_callback extends uvm_callback;
  
 //factory registration
 `uvm_object_utils(i2c_driver_callback)

 function new(string name = "i2c_driver_callback");
  super.new(name);
 endfunction

 virtual task stop_condition();
 endtask
endclass

