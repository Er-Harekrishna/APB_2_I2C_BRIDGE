//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_pready_cb.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the user defined callback extended from the driver callback 
//                   for i2c stop condition implementation 
//------------------------------------------------------------------------------------------------------------------//

class apb_pready_cb extends apb_driver_pready_callback;

//fafctory registration 
 `uvm_object_utils(apb_pready_cb)

//handle of virtual interface
  virtual apb_inf vif ;
 
//function new
 function new(string name = "apb_pready_cb");
  super.new(name);
 endfunction

 task pready_callback();
  fork
   vif.force_pready();   
  join_none 
 endtask

endclass
