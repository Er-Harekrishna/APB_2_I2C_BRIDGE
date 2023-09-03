//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_2_i2c_sb.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the scoreboard for the comparison of actual and expected data
//------------------------------------------------------------------------------------------------------------------//
`uvm_analysis_imp_decl(_apb_imp)
`uvm_analysis_imp_decl(_i2c_imp)

class apb_2_i2c_sb extends uvm_scoreboard;
   // regester 
  `uvm_component_utils(apb_2_i2c_sb)

  virtual apb_inf apb_vif ;
  
  uvm_analysis_imp_apb_imp #( apb_trans , apb_2_i2c_sb ) APB_anl_imp;
  uvm_analysis_imp_i2c_imp #( i2c_trans , apb_2_i2c_sb ) I2C_anl_imp;
  
  logic [`DATA_WIDTH-1 : 0 ] mem [`DEPTH];

  //transaction handles
  apb_trans apb_trans_h;
  i2c_trans i2c_trans_h;

  // virtual interface 
  virtual i2c_inf i2c_vif ;

 bit [2:0] wr_ptr, rd_ptr;
 bit flag;
 int rst_cp_flag; 

 logic [`DATA_WIDTH - 1 : 0 ] rdata_sb;
 logic [`DATA_WIDTH - 1 : 0 ] temp_data;


//covergroup for i2c beans 
  covergroup i2c_bean_cg with function sample(i2c_trans item_h);
   rd_ptr_full: coverpoint rd_ptr{ bins b1 = {7};}
   rd_ptr_transition : coverpoint rd_ptr{ bins b2 = (7 => 0);}//overflow
   rd_ptr_incr_cp : coverpoint rd_ptr{ bins b3 = (0=>1=>2=>3=>4=>5=>6=>7);}
  endgroup
 
//covergroup for apb beans 
  covergroup apb_bean_cg with function sample(apb_trans item_h);
   wr_ptr_full: coverpoint wr_ptr{ bins b1 = {7};}
   wr_ptr_transition : coverpoint wr_ptr{ bins b2 = (7 => 0);}//overflow
   wr_ptr_incr_cp : coverpoint wr_ptr{ bins b3 = (0=>1=>2=>3=>4=>5=>6=>7);}
  // same_data_cp: coverpoint item_h.pdwata_in{ bins b2[] = ('hba[*3]);}
  endgroup

 covergroup rst_cg ;
  num_rst_cp: coverpoint rst_cp_flag{ bins b1 = {2};}
 endgroup

  // function new 
  function new(string name = "apb_2_i2c_sb" , uvm_component parent);
    super.new(name , parent);
     i2c_bean_cg = new();
     apb_bean_cg = new();
     rst_cg      = new();
  endfunction 
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);    
    APB_anl_imp = new("APB_anl_imp" , this);
    I2C_anl_imp = new("I2C_anl_imp" , this); 
//getting virtual interface 
    if(!(uvm_config_db #(virtual apb_inf) :: get(this , "" , "vif" , apb_vif )))
     `uvm_fatal(get_name , "cant get apb interface in scoreboard")

  endfunction 

//method to get the transaction from apb monitor
  function void write_apb_imp( apb_trans apb_trans );
    if(apb_trans.pwrite == 1'b1 ) begin
   //sampling for apb_covergroup 
    apb_bean_cg.sample(apb_trans);
      mem[wr_ptr] = apb_trans.pwdata_in;
     `uvm_info(get_name , $sformatf("------------->data in internal memory  , act_data :- %0h" ,mem[wr_ptr] ) , UVM_LOW )
      if(wr_ptr == 0) begin
        temp_data = mem[wr_ptr];
      end 
      wr_ptr++ ;
      if(wr_ptr == 0) begin
       temp_data = mem[wr_ptr];
       flag = 1'b1;
      end
    end

  endfunction 


//method to get transcation from i2c monitor and comparaing the expected and actual data
  function void write_i2c_imp( i2c_trans i2c_trans );
  
   //sampling for i2c_covergroup 
    i2c_bean_cg.sample(i2c_trans);
    rdata_sb = i2c_trans.data;
    
    if(flag ==1) begin
      rdata_sb = mem[0];
      flag = 1'b0;
      `uvm_info(get_name,("======   flag =1 ============"),UVM_LOW)
    end
  
//comparison for expected data and actual data 
      if(mem[rd_ptr] == rdata_sb)
        `uvm_info(get_name , $sformatf("!!!!PASSSSSS!!!!  , actual_data :- %0h , expected_data :- %0h,rd_ptr:-%0d" , rdata_sb ,mem[rd_ptr] ,rd_ptr) , UVM_LOW )
      else
        `uvm_error(get_name , $sformatf("-_- -_- FAILL -_- -_-  , actual_data :- %0h , expected_data :- %0h,rd_ptr:-%0d"  , rdata_sb, mem[rd_ptr],rd_ptr ) )
    
    rd_ptr ++;
  endfunction 

//run phase
  task run_phase(uvm_phase phase);
     forever begin
       @(negedge apb_vif.presetn)
        `uvm_info(get_name , "-------------------------------------in run phase of scoreboard",UVM_LOW)
         foreach(mem[i])begin
           mem[i] = 0;end
      
     /*   if(rd_ptr ==0)begin 
         mem[0]=temp_data;end
       */
      `uvm_info(get_name,$sformatf("===> mem[0] = %h",mem[0]),UVM_LOW)
     
       rst_cp_flag++; 
       rst_cg.sample(); 
     
    end
  endtask

endclass 

