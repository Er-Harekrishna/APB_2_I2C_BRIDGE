//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : apb_driver.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the driver for the apb master 
//------------------------------------------------------------------------------------------------------------------//
`define DRV_INF vif.APB_WDR_MP
class apb_driver extends uvm_driver #(apb_trans);

//factory registration
`uvm_component_utils(apb_driver)

 //callback registration
  `uvm_register_cb(apb_driver,apb_driver_callback)
  `uvm_register_cb(apb_driver,apb_driver_pready_callback)

//virtual interface declaration
 virtual apb_inf vif;
 

function new(string name = "apb_driver",uvm_component parent = null);
 super.new(name,parent);
endfunction

//build phase
function void build_phase(uvm_phase phase);
 super.build_phase(phase);
endfunction

//run phase for driving the transcation level information to the interface
task run_phase(uvm_phase phase);

 `uvm_info(get_type_name(),"inside runphase of apb driver",UVM_LOW);
 drive_initial_value();
  //waiting for not of reset
 @(posedge vif.presetn);
 `uvm_info(get_type_name(),"inside runphase of apb driver after presetn",UVM_LOW);
 fork
 forever @(posedge vif.APB_WDR_MP.clk) begin
 `uvm_info(get_type_name(),"inside runphase of apb driver forever loop",UVM_LOW);
  seq_item_port.get_next_item(req);
  send_to_dut(req);
  seq_item_port.item_done();
 end
 join
endtask

//send_to_dut function to drive information to interface
task send_to_dut(apb_trans trans);
 trans.print();
 fork 
  begin
   if(`DRV_INF.psel == 0) begin
 //`uvm_info(get_type_name(),"in ##################apb driver if psel = 0##########",UVM_LOW);
 //   `uvm_info("in ##################apb driver if psel =0##########");
   // @(posedge vif.APB_WDR_MP.clk);
    //`DRV_INF.psel <= trans.psel;
    `DRV_INF.psel <= 1'b1;
    `DRV_INF.paddr <= 8'hff;
    `DRV_INF.pwrite <= trans.pwrite;
    if(trans.pwrite)begin
 //  @(negedge vif.APB_WDR_MP.clk) 
     `DRV_INF.pwdata_in <= trans.pwdata_in;
    end

   @(posedge vif.APB_WDR_MP.clk);
  // `DRV_INF.penable <= trans.penable;
  `uvm_do_callbacks(apb_driver,apb_driver_callback,pwdata_change_condition());  
  `uvm_do_callbacks(apb_driver,apb_driver_callback,paddr_change_condition());  
   `DRV_INF.penable <= 1'b1;
 end

 else begin
  //@(posedge vif.APB_WDR_MP.clk);
 //   `uvm_info(get_type_name(),"in ##################apb driver else psel =1##########",UVM_LOW);
  `DRV_INF.paddr <= 8'hff;
    `DRV_INF.pwrite <= trans.pwrite;
    if(trans.pwrite)begin
     `DRV_INF.pwdata_in <= trans.pwdata_in;
    end

   `DRV_INF.penable <= 1'b1;

   //#2;
 end
 
   wait(`DRV_INF.pready == 1'b1);
  `uvm_do_callbacks(apb_driver,apb_driver_pready_callback,pready_callback());
// `uvm_info({get_full_name(),"::driver_tx"},"!!!!!!!!!!!!!!!!!!!after  for pready@!!!!!!!!!!!!!!!!!!!!",UVM_LOW)
  @(posedge vif.APB_WDR_MP.clk);
//  #1;
   `DRV_INF.penable <= 1'b0;
  // `DRV_INF.pwrite <= 1'b0;
  if(trans.psel_toggle == 1'b1)begin
    `DRV_INF.psel <= 1'b1;
    `DRV_INF.pwrite <= 1'b1;end
  else begin
    `DRV_INF.psel <= 1'b0;
    `DRV_INF.pwrite <= 1'b0;
  end
 end
  begin 
   @(negedge vif.presetn);
  end

 join_any

 disable fork;
// drive_initial_value();

endtask

//on preset we need to initialize the values
task drive_initial_value() ;
 `DRV_INF.psel       <= 0 ;
 `DRV_INF.penable    <= 0 ;
 `DRV_INF.pwrite     <= 0 ;
 `DRV_INF.pwdata_in  <= 0;
 `DRV_INF.paddr      <= 0;
endtask  

endclass 
  


