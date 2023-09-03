//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : i2c_base_rseqs.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the base read seqs for the i2c master 
//------------------------------------------------------------------------------------------------------------------//
class i2c_base_rseqs extends uvm_sequence #(i2c_trans);

   `uvm_object_utils(i2c_base_rseqs)

    i2c_trans trans_h;

   rand int no_of_trans;

    function new (string name = "i2c_base_rseqs");
       super.new(name);
    endfunction
endclass
