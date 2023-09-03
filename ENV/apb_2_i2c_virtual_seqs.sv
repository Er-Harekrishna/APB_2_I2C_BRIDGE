//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_2_i2c_virtual_seqs.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the virtual sequence
//------------------------------------------------------------------------------------------------------------------//
class apb_2_i2c_virtual_seqs extends uvm_sequence#(uvm_sequence_item);

//factory registration
 `uvm_object_utils(apb_2_i2c_virtual_seqs);

 virtual apb_inf vif_h;

//function new
 function new(string name ="apb_2_i2c_virtual_seqs");
  super.new(name);
 endfunction

//virtual sequencer handle
// apb_2_i2c_virtual_seqr vseqr_h;
 `uvm_declare_p_sequencer(apb_2_i2c_virtual_seqr);
 
 //sequencer handle
 apb_seqr apb_seqr_h;
 i2c_seqr i2c_seqr_h;
 
 // handle of sequence 
 //apb_2_i2c_sanity_seqs apb_seqs ;
 

  
 task pre_body();
  
  if(!$cast(p_sequencer,m_sequencer))
   `uvm_fatal(get_full_name(),"virtual sequencer failed!")
  
  apb_seqr_h = p_sequencer.apb_seqr_h;
  i2c_seqr_h = p_sequencer.i2c_seqr_h;
  
 endtask

 //task body ();
  
//endtask 

endclass


  
