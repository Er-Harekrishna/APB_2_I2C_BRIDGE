//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_base_seqs.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the write base seqs for the apb master 
//------------------------------------------------------------------------------------------------------------------//
class apb_base_seqs extends uvm_sequence #(apb_trans);

   `uvm_object_utils(apb_base_seqs)

    apb_trans trans_h;

   rand int no_of_trans;

    function new (string name = "apb_base_seqs");
       super.new(name);
    endfunction
endclass
