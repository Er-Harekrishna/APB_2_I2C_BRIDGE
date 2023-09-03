//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : i2c_seqr.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the sequencer for the i2c master 
//------------------------------------------------------------------------------------------------------------------//

class i2c_seqr extends uvm_sequencer #(i2c_trans);
 
`uvm_component_utils(i2c_seqr)

 function new( string name = "i2c_trans", uvm_component parent =null);
  super.new(name,parent);
 endfunction

endclass
