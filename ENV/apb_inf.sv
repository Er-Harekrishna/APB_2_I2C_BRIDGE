//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_inf.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the interface for the apb master 
//------------------------------------------------------------------------------------------------------------------//
interface apb_inf(input bit clk);
 
 // reset signal 
 logic presetn ;

//dut signals declaration 
 logic psel;
 logic penable;
 logic pwrite;
 logic pready;
 logic [7:0] pwdata_in;
 logic [7:0] paddr;
 logic [7:0] prdata_out;

//modports 
 modport APB_MON_MP (input pready,input prdata_out,input psel,input paddr,input pwdata_in,input pwrite,input penable,input presetn,input clk);
 

modport APB_WDR_MP (input pready,input prdata_out,output psel,output paddr,output pwdata_in,output pwrite,output penable,input clk);

/*
 task reset();
  presetn = 1'b0;
  #10;
  presetn = 1'b1;
 endtask 
 */

 task force_pready();
  force pready=1'b1;
  #10;
  release pready;
 endtask
 endinterface
 
 
