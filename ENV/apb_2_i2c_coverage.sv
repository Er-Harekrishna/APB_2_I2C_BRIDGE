//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_2_i2c_coverage.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the subscriber for functional coverage 
//------------------------------------------------------------------------------------------------------------------//
`uvm_analysis_imp_decl(_apb_imp_sub)
`uvm_analysis_imp_decl(_i2c_imp_sub)

//class apb_2_i2c_subscriber extends uvm_subscriber#(apb_trans);
class apb_2_i2c_coverage extends uvm_component;
  
 // factory registration 
  `uvm_component_utils(apb_2_i2c_coverage)

 //analysis import
  uvm_analysis_imp_apb_imp_sub #( apb_trans , apb_2_i2c_coverage ) APB_anl_imp;
  uvm_analysis_imp_i2c_imp_sub #( i2c_trans , apb_2_i2c_coverage ) I2C_anl_imp;

 //transaction class handles
  apb_trans apb_trans_h;
  i2c_trans i2c_trans_h;

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);    
    APB_anl_imp = new("APB_anl_imp" , this);
    I2C_anl_imp = new("I2C_anl_imp" , this);
  endfunction

//covergroup for apb
  covergroup apb_bean_cg with function sample(apb_trans item_h);
   pwrite_cp : coverpoint item_h.pwrite{bins b1 = {0,1};} //for pwrite 
   paddr_cp  : coverpoint item_h.paddr{ bins b2 = {8'hff};}//paddr 
   psel_toggle_cp : coverpoint item_h.psel_toggle{ bins b3 ={0,1};} //toggle for pwrite
   same_data_cp: coverpoint item_h.pwdata_in{ bins b2[] = ('hba[*8]);}//same data
   pwrite_all_high: coverpoint item_h.pwrite { bins b3[] = ('b1[*8]);}//all high pwrite for all transaction

  endgroup

//covergroup for i2c
  covergroup i2c_bean_cg with function sample(i2c_trans item_h);
   i2c_addr : coverpoint item_h.address{ bins b1 = {7'd101};} //for i2c addr
   i2c_mode : coverpoint item_h.mode {bins b2 = {1,0};} //mode(0:write 1:read) 
  endgroup

//function new
  function new(string name ="apb_2_i2c_subscriber",uvm_component parent);
   super.new(name,parent);
   apb_bean_cg = new;
   i2c_bean_cg = new;
  endfunction
  
 //write method for sampling data from monitor as well start sampling for covergroup for apb   
  function void write_apb_imp_sub(apb_trans t );
   //apb_trans_h = t;
   apb_bean_cg.sample(t);
  endfunction

 //write method for sampling data from monitor as well start sampling for covergroup for i2c   
  function void write_i2c_imp_sub(i2c_trans t );
   //i2c_trans_h = t;
   i2c_bean_cg.sample(t);
  endfunction

endclass 
