//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_i2c_env.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contain the environment for creation of agents of respective masters
//                   this contains apb_agent and i2c_agent 
//------------------------------------------------------------------------------------------------------------------//
class apb_i2c_env extends uvm_env;
  
 `uvm_component_utils(apb_i2c_env);

 apb_agent apb_agnt_h;
 i2c_agent i2c_agnt_h;
 apb_2_i2c_sb sb_h;
 apb_2_i2c_coverage apb_i2c_sub_h;

 apb_2_i2c_virtual_seqr vseqr_h;
 
 function new(string name = "apb_i2c_env",uvm_component parent = null);
  super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  apb_agnt_h = apb_agent::type_id::create("apb_agnt_h",this);
  i2c_agnt_h = i2c_agent::type_id::create("i2c_agnt_h",this);
  sb_h       = apb_2_i2c_sb::type_id::create("sb_h",this);
  apb_i2c_sub_h  = apb_2_i2c_coverage::type_id::create("apb_sub_h",this);
  vseqr_h    = apb_2_i2c_virtual_seqr::type_id::create("vseqr_h",this);
 endfunction

 function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  apb_agnt_h.mon_h.write_a_port.connect(sb_h.APB_anl_imp);
  i2c_agnt_h.mon_h.write_a_port.connect(sb_h.I2C_anl_imp);
  i2c_agnt_h.mon_h.write_a_port.connect(apb_i2c_sub_h.I2C_anl_imp);
  apb_agnt_h.mon_h.write_a_port.connect(apb_i2c_sub_h.APB_anl_imp);
  vseqr_h.apb_seqr_h = apb_agnt_h.seqr_h;
  vseqr_h.i2c_seqr_h = i2c_agnt_h.seqr_h;
 endfunction

endclass

 
 
 
