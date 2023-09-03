//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : i2c_base_seqs.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the base read seqs for the i2c master 
//------------------------------------------------------------------------------------------------------------------//
class i2c_base_seqs extends uvm_sequence #(i2c_trans);

   `uvm_object_utils(i2c_base_seqs)

    i2c_trans trans_h;

   rand int num_of_trans;

    function new (string name = "i2c_base_seqs");
       super.new(name);
    endfunction
endclass
