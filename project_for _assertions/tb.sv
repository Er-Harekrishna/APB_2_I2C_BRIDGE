// or browse Examples
module tb();
  reg clk ;
  reg rst1 ;
  reg rst2 ;
  reg secure_in ;
  
  wire [31:0] data ;
  wire secure_out ;
  wire status ;
  wire strobe ;
  
  wire gated_clk;
  bit  enable ;
  
  rtl DUT( .clk(gated_clk) , .rst1(rst1) , .rst2(rst2) , .secure_in(secure_in) , .secure_out(secure_out) , .status(status) , .strobe(strobe) , .data(data) );
  
  bind rtl assertion AUT( .clk(clk) , .rst1(rst1) , .rst2(rst2) , .secure_in(secure_in) , .secure_out(secure_out) , .status(status) , .strobe(strobe) , .data(data) );

  assign gated_clk = (clk && enable) ;
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk ;
  end
  
  initial begin
    // both reert occur at same time and secure = "0"
    rst1 = 0; enable = 0;
    rst2 = 0; 
    secure_in = 0;
    
    #50 ; //@(posedge clk) ;    
    rst1 = 1 ; enable = 1;
    rst2 = 1 ;
    
    repeat(20) @(negedge clk);
    
   
    // only reset1 occur and secure = "0"
    repeat(2) @(posedge clk) ;    
    rst1 = 0 ; enable = 0;
    rst2 = 1 ; 
        
    //repeat(2) @(posedge clk);
    #20;
    rst2 = 1;
    rst1 = 1;  enable = 1 ;
            
    repeat(20) @(negedge clk);
    
    // only reset2 occur and secure = "0"
    $display($time, " only reset2 occur and secure = 0");
    repeat(2) @(posedge clk);
    rst2 = 0;
    rst1 = 1;
    
    repeat(2) @(posedge clk);
    rst2 = 1;
    rst1 = 1;
    
    repeat(20) @(negedge clk);
 
    // reset2 occur and before reset2 goes high reset1 assert and deassert   
    $display($time, "occur and before reset2 goes high reset1 assert and deassert");
    repeat(2) @(posedge clk);
    rst1 = 1;
    rst2 = 0;
    
    repeat(3) @(posedge clk);
    rst1 = 0;  enable = 0;
    rst2 = 0;
    
    //repeat(3) @(posedge clk);
    #20;
    
    rst1 = 1; enable = 1 ;
    rst2 = 0;   
    
    repeat(3) @(posedge clk);
    rst1 = 1;
    rst2 = 1;   
    repeat(20) @(negedge clk);
    
    
    $display($time, "occur and before reset2 goes high reset1 assert and deassert");
    repeat(2) @(posedge clk);
    rst1 = 0; enable = 0;
    rst2 = 1;
    
    //repeat(3) @(posedge clk);
    #20;
    rst1 = 0;
    rst2 = 0;
    
    //repeat(3) @(posedge clk);
    #40;
    rst1 = 0;
    rst2 = 1;   
    
    //repeat(3) @(posedge clk);
    #40;
    rst1 = 1; enable =1;
    rst2 = 1;   
    repeat(20) @(negedge clk);
    $finish();
  end
  
endmodule
