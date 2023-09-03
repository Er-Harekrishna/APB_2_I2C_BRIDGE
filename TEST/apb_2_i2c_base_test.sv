//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_2_i2c_base_test.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the base test for all testcases
//------------------------------------------------------------------------------------------------------------------//
class apb_2_i2c_base_test extends uvm_test;
 `uvm_component_utils(apb_2_i2c_base_test)
 
//handle for environment 
  apb_i2c_env env_h;

//VIRTUAL INTERFACE HANDLE
 virtual apb_inf vif;
  
//function new
 function new(string name = "apb_2_i2c_base_test" , uvm_component parent );
   super.new(name,parent);
 endfunction 

//build phase
 function void build_phase(uvm_phase phase );
   env_h = apb_i2c_env::type_id::create("env_h",this);
   if(!uvm_config_db#(virtual apb_inf)::get(this,"","vif",vif))
      `uvm_fatal("APB_AGENT","Not able to get the virtual interface");

 endfunction 

//end od elaboration phase
 function void end_of_elaboration_phase(uvm_phase phase);
   uvm_top.print_topology();
 endfunction

//report phase for pass and fail message 
 function void report_phase(uvm_phase phase);
   uvm_report_server svr ;
   svr = uvm_report_server::get_server(); //get_server():Gets the global report server used for reporting.
   
   //  get_severity_count :returns the count of already passed messages with severity severity
  

 if((svr.get_severity_count(UVM_ERROR) + svr.get_severity_count(UVM_FATAL)) == 0)begin
					 $display("///////////////////////////////////////////////////////////////");
           $display("////           *******  ******  ****** ******    |||       ////");
           $display("////           *******  ******  ****** ******    |||       ////");
           $display("////           **   **  **  **  **     **        |||       ////");
           $display("////           **   **  **  **  **     **        |||       ////");
           $display("////           *******  ******  *****  ******    |||       ////");
           $display("////           *******  ******  *****  ******    |||       ////");
           $display("////           **       **  **     **      **    |||       ////");
           $display("////           **       **  **     **      **    |||       ////");
           $display("////           **       **  **  *****  ******    |||       ////");
					 $display("////           **       **  **  *****  ******    ...       ////");
					 $display("///////////////////////////////////////////////////////////////");
	         end
		 else begin
					 $display("//////////////////////////////////////////");
           $display("//// *****  *****  *****  *           ////");
           $display("//// *      *   *    *    *           ////");
           $display("//// *      *   *    *    *           ////");
           $display("//// *****  *****    *    *           ////");
           $display("//// *      *   *    *    *           ////");
           $display("//// *      *   *    *    *           ////");
           $display("//// *      *   *  *****  *****       ////");
					 $display("//////////////////////////////////////////");
   end 

 endfunction 

endclass
