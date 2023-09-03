//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : i2c_trans.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the sequence item need to have stimulus generated through sequence for i2c master
//------------------------------------------------------------------------------------------------------------------//

class i2c_trans extends uvm_sequence_item;

//declaration of the items needed fro having transaction through sequence
rand bit [6:0]address;
rand bit [7:0] data;
rand bit mode;
rand bit cb;

 constraint MOD{soft mode == 1'b1;}
 constraint ADDR{soft address == 7'd101;}
 constraint CALLBACK{soft cb == 1'b0;}
//factory registration
 
 `uvm_object_utils_begin(i2c_trans)
 `uvm_field_int(address,UVM_ALL_ON) 
 `uvm_field_int(data,UVM_ALL_ON)
 `uvm_field_int(mode,UVM_ALL_ON) 
 `uvm_field_int(cb,UVM_ALL_ON) 
 `uvm_object_utils_end

 function new(string name = "i2c_trans");
  super.new(name);
 endfunction
 
endclass



 
 
