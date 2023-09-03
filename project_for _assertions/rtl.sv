// Code your design here
module rtl(
            input clk,
            input rst1,
            input rst2,
            input secure_in,
            output reg [31:0]data,
            output reg secure_out,
            output reg status,
            output reg strobe
           );
  
  reg [31 : 0 ] temp ; 
  
  reg [31 : 0 ] clock_cnt ;
  
  //wire 
  
  initial begin
    data = 0;
  end
  
  
  
  always @(negedge rst1) begin   
    // clock count increament if rst1 high  
   /* if(rst1 && (clk == 1))begin
      clock_cnt++;
    end
    */
    if(!rst1 && !rst2 ) begin
      secure_out = 1'b0;
      status     = 1'b1;
      strobe     = 1'b0;
      data       = 32'h0;      
      clock_cnt  = 0;
      //$display($time,"data %0d:",data);
     fork
      begin 
       @(posedge rst1);      
       @(posedge clk);
      
       secure_out <= secure_in;
      end
     join_none
     // end
     end   
    else if(!rst1 ) begin
      secure_out = 1'b0;
      status     = 1'b1;
      strobe     = 1'b0;
      data       = 32'hff;      
      clock_cnt  = 0;
      //$display($time,"data %0d:",data);
      fork
        begin
         @(posedge rst1);      
         @(posedge clk);
      //$display($time,"data sjdbjbjbjbs%0d:",data);
         secure_out = secure_in;
        end
      join_none
     // #1;
      end
  end  
    
  always @(negedge rst2) begin    
    
    if(!rst2) begin
      secure_out = secure_out;
      status     = status;
      strobe     = strobe;
      data       <= 32'h00;
      temp       <= data  ; 
      
      $display($time,"data rst2 %0d:",data);
      fork begin
      $display($time,"data rst_ %0d:  %0d",data,temp);
      @(posedge rst2);
      
       if(secure_in)
         data = 'h00;
       else 
         data = temp ; 
        $display($time,"data rst_ %0d:  %0d",data,temp); 
      end  
      join_none
      #1;
    end
    
    if(!rst1 && !rst2 ) begin
      secure_out = 1'b0;
      status     = 1'b1;
      strobe     = 1'b0;
      data       = 32'h0;      
      clock_cnt  = 0;
      //$display($time,"data %0d:",data);
     fork
      begin 
       @(posedge rst1);      
       @(posedge clk);  
       secure_out <= secure_in;
      end
     join_none
     // end
     end
  end
   
    
    always@(posedge clk) begin
      if(rst1) begin
         clock_cnt++;
      end
      
      if(clock_cnt == 9 )begin
        status = '0 ;     
        if(secure_in == 0)
          data = 'hff ;
       // $display($time,"data asd %0d:",data);
      end
      
      if(clock_cnt == 14) begin
        strobe = '1 ;
        if(secure_in) 
          data = 'hff ;
        //$display($time,"data dssd %0d:",data);
      end
      
      if (clock_cnt == 15)
        strobe = '0 ;   
    end
      
 /* 
  always @(posedge clk,negedge rst2) begin
    if(!rst2) begin
      secure_out = secure_out;
      status     = status;
      strobe     = strobe;
      data       = 32'h00;
      temp 
    end
   */ 
   
  
 /* always @(negedge status) begin
    temp_clk = clock_cnt ;
      $display(clock_cnt , "  " , temp_clk);
    while( (temp_clk+5) == clock_cnt ) begin
      $display(clock_cnt , "  " , temp_clk);
      strobe <= 1 ;
    end
  end
  */
endmodule
 
