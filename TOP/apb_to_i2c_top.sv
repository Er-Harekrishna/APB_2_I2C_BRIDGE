//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_to_i2c_top.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the top for the project which contains dut
//                   instantiation as weel as the instantiation for assertions ,contains
//                   configuration for virtual interface and generation of clocks
//------------------------------------------------------------------------------------------------------------------//
`timescale 100ns/1ps

`include "pkg.sv"

module apb_to_i2c_top;
 
 //importing the package
 import uvm_pkg::*;
 import pkg::*;
`include "uvm_macros.svh"

 bit clk;
 bit scl;

//interface instantiation
 apb_inf inf_apb(clk);
 i2c_inf inf_i2c(scl);

//DUT instantiation
 apb_i2c_cnv DUT (.scl(inf_i2c.scl)
                  ,.sda(inf_i2c.sda)
                  ,.psel(inf_apb.psel)
                  ,.penable(inf_apb.penable)
                  ,.paddr(inf_apb.paddr)
                  ,.pwrite(inf_apb.pwrite)
                  ,.preset(inf_apb.presetn)
                  ,.pclk(inf_apb.clk)
                  ,.pwdata_in(inf_apb.pwdata_in)
                  ,.prdata_out(inf_apb.prdata_out)
                  ,.pready(inf_apb.pready));

//assertion binding
 bind apb_i2c_cnv apb_i2c_assertion AST(.scl(inf_i2c.scl)
                  ,.sda(inf_i2c.sda)
                  ,.psel(inf_apb.psel)
                  ,.penable(inf_apb.penable)
                  ,.paddr(inf_apb.paddr)
                  ,.pwrite(inf_apb.pwrite)
                  ,.preset(inf_apb.presetn)
                  ,.pclk(inf_apb.clk)
                  ,.pwdata_in(inf_apb.pwdata_in)
                  ,.prdata_out(inf_apb.prdata_out)
                  ,.pready(inf_apb.pready));

//apb clk generation
 always #1.25 clk = ~clk;

//i2c clk generation
 always #50 scl = ~scl;

 initial begin 
  uvm_config_db #(virtual apb_inf)::set(null,"*","vif",inf_apb);
  uvm_config_db #(virtual i2c_inf)::set(null,"*","vif",inf_i2c);
  run_test("reset_on_the_fly_test");  
 end

 initial begin
  inf_apb.presetn = 0 ;
  #10;
  inf_apb.presetn = 1 ;
 end


endmodule
  

 



 
  
