//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : i2c_driver.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the driver for the i2c master to drive the information 
//                   to dut through interface(transaction level to pin level) by using sequence coming through sequencer
//------------------------------------------------------------------------------------------------------------------//
class i2c_driver extends uvm_driver#(i2c_trans);
 `uvm_component_utils(i2c_driver)
 
 //callback registration
  `uvm_register_cb(i2c_driver,i2c_driver_callback)
  

 // handle of i2c virtual interface
  virtual i2c_inf vif ;
  int i;

 // function new
 function new(string name = "i2c_driver" , uvm_component parent );
   super.new(name , parent);
 endfunction

//run phase for driving the transcation level information to the interface
 task run_phase (uvm_phase phase );
   super.run_phase(phase);

   vif.sda_out <= 1 ;
   forever begin
     //starting the transfer by getting it from information from sequence 
     seq_item_port.get_next_item(req);
     
     //start condition
     i2c_start();
     
     //driving address ;
 
    if(req.cb == 1) begin
     `uvm_do_callbacks(i2c_driver,i2c_driver_callback,stop_condition());
    end
    else begin       
     //checking at 9 posedge
     // acknowlegement received or not 
     driving_address();
     @(posedge vif.scl);
     // if ack recieved  
     if(vif.sda == 0 ) begin
        if(req.mode == 1 ) begin
         read_operation();
         end 
         else begin
         write_operation();
         end 
      end 
    
     i2c_stop();
   end
    seq_item_port.item_done();
 end
 endtask

 task i2c_start();
    // driveing start condition 
     @(posedge vif.scl) begin
       vif.sda_out <= 0 ; 
     end
 endtask 

 task i2c_stop();
  // now dring stop condition
   
  @(posedge vif.scl);
  vif.I2C_STR_STP.sda_out <=1;
  
endtask

 task driving_address();
     i = 6 ;
     // driving address 
     repeat(7) begin 
       @(negedge vif.scl);
         vif.sda_out <= req.address[i--];
     end
    @(negedge vif.scl);
     vif.sda_out <= req.mode;

     // now releasing sda line  
     @(negedge vif.scl);       
       vif.sda_out <= 'z;
 endtask

 task read_operation();
   repeat(8) begin
     @(negedge vif.scl) ;
     vif.sda_out <= 'z; 
   end
   // driving ACK 
   @(negedge vif.scl);
   vif.sda_out <=0 ;        
   `uvm_info(get_name, "-----driving ACK-----",UVM_LOW);

 endtask
 
 task write_operation();
   i = 0;
   repeat(8) begin
     @(negedge vif.scl);
     vif.sda_out <= 'z;
     end
     @(negedge vif.scl);
     vif.sda_out <= 'z;
       
     @(posedge vif.scl);
       if(vif.sda == 0)
         `uvm_info(get_name, "driving data ##ACK##",UVM_DEBUG)
       else
         `uvm_info(get_name,"driving data ##NACK##",UVM_DEBUG)
 endtask
 
endclass

