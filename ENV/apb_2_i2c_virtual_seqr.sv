//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_2_i2c_virtual_seqr.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the virtual sequencer
//------------------------------------------------------------------------------------------------------------------//
class apb_2_i2c_virtual_seqr extends uvm_sequencer#(uvm_sequence_item);
 
 `uvm_component_utils(apb_2_i2c_virtual_seqr);

 function new(string name = "apb_2_i2c_virtual_seqr",uvm_component parent = null);
  super.new(name , parent);
 endfunction
 
 apb_seqr apb_seqr_h;
 i2c_seqr i2c_seqr_h;

endclass
