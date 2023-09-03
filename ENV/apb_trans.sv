//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_trans.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the sequence item need to have stimulus generated through sequence for apb master
//------------------------------------------------------------------------------------------------------------------//

class apb_trans extends uvm_sequence_item;

//declaration of the items needed fro having transaction through sequence
 rand bit pwrite;
 rand bit [7:0] pwdata_in;
 rand bit [7:0] paddr;
 rand bit psel_toggle;

// constraint PEN{soft penable == 1'b1;}
 constraint PWR{soft pwrite == 1'b1;}
 constraint PADDR{soft paddr == 8'hff;}
 constraint PSEL{soft psel_toggle == 1'b1;}
// constraint PDATA{soft pwdata_in == 8'hba;}
 

//factory registration
 
 `uvm_object_utils_begin(apb_trans)
   `uvm_field_int(psel_toggle,UVM_ALL_ON)
   //`uvm_field_int(penable,UVM_ALL_ON)
   `uvm_field_int(pwrite,UVM_ALL_ON)
   `uvm_field_int(pwdata_in,UVM_ALL_ON)
   `uvm_field_int(paddr,UVM_ALL_ON)
 `uvm_object_utils_end

 function new(string name = "apb_trans");
  super.new(name);
 endfunction
 
endclass

