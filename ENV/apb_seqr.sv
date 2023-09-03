//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_seqr.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the sequencer for the apb master 
//------------------------------------------------------------------------------------------------------------------//

class apb_seqr extends uvm_sequencer #(apb_trans);
 
`uvm_component_utils(apb_seqr)

 function new( string name = "apb_trans", uvm_component parent =null);
  super.new(name,parent);
 endfunction

endclass


