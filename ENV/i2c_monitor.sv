//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : i2c_monitor.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the monitor for the i2c master to monitor the
//                   information getting from dut and passing it to scoreboard for comparison  
//------------------------------------------------------------------------------------------------------------------//
class i2c_monitor extends uvm_monitor;
  `uvm_component_utils(i2c_monitor)
  //virtual interface 
  virtual i2c_inf vif ;
  
  // analysis port 
  uvm_analysis_port #(i2c_trans) write_a_port;
  
  // que for storing data 
  logic i2c_que[$];

  i2c_trans trans_h ;

  // function new 
  function new (string name = "i2c_monitor", uvm_component parent);
    super.new(name, parent);
    write_a_port = new("write_a_port" , this);
  endfunction 

  task run_phase(uvm_phase phase);
   
   fork 
    forever begin
  // $display("---------------------------------------in run phase of i2c monitor---------------------------------");   
      // waiting for start condition 
      @(negedge vif.sda);
      if(vif.scl == 1 && vif.sda == 0 ) begin
      trans_h = i2c_trans::type_id::create("trans_h");
      i2c_que = {};

      // sampling address 
      repeat(7) begin
        @(posedge vif.scl);
        i2c_que.push_back(vif.sda);
      end      
     
      trans_h.address = {>>{i2c_que}}; // storing address 
      
      //$display($time, " mas mon addr %b " , trans_h.I2C_slv_addr );

      @(posedge vif.scl);              
      trans_h.mode = vif.sda;

      `uvm_info("mon_addr" , $sformatf("sample address in dec %0d " , trans_h.address ) , UVM_LOW)
      // wait for ack 

      @(posedge vif.scl);
      
      // clearing previous data 
      i2c_que = {};

      // if read opertion than sample data 
      if({trans_h.address , trans_h.mode } == 8'hcb ) begin
        repeat(8) begin
          @(posedge vif.scl);
          i2c_que.push_back(vif.sda);
        end
        
        // storing read data in transection class read data 
        trans_h.data = {>>{ i2c_que }};
        
        `uvm_info("mon_data" , $sformatf("sample read data in hex %h " , trans_h.data) , UVM_LOW)
      end
      else
        `uvm_error(get_name,"address does not match")
    end
   end
   
   forever @(posedge vif.sda) begin
    if((vif.sda==1)&&( vif.scl==1)) begin//waiting for stop condition
    write_a_port.write(trans_h); 
    `uvm_info("mon_data" , $sformatf("sample read data afte stop #########in hex %h " , trans_h.data) , UVM_LOW)
       
    end
   end
 join
  endtask 
endclass
