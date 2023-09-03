//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : i2c_stop_condition_cb.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the user defined callback extended from the driver callback 
//                   for i2c stop condition implementation 
//------------------------------------------------------------------------------------------------------------------//

class i2c_stop_condition_cb extends i2c_driver_callback;

//fafctory registration 
 `uvm_object_utils(i2c_stop_condition_cb)

//handle of virtual interface
  virtual i2c_inf vif ;
 
//function new
 function new(string name = "i2c_stop_condition_cb");
  super.new(name);
 endfunction

 task stop_condition();
  @(posedge vif.scl);
  #1;
  vif.I2C_STR_STP.sda_out <=1;
  @(negedge vif.scl);
 endtask

endclass
