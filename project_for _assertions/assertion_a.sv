
module assertion(
                input clk,
                input rst1,rst2,
                input secure_in,
                input  secure_out,
                input   status,
                input   strobe,
                input  [31:0]data );

//both rst1 and rst2 are deasserted
property def_cond;
disable iff(!rst1 && !rst2)
  @(posedge clk) $rose(rst1) |-> ##9 $fell(status) ##5 $rose(strobe);
endproperty

property rst1_rst2_assert;
disable iff(rst1 && rst2)
   @(posedge clk)  (!rst1 && !rst2) |-> status ##0  (!strobe && (data=='h00) && !secure_out);
endproperty


//check if strobe signal is valid till only one clock cycle
property strobe_sig;
  @(posedge clk) strobe |=> !strobe;
endproperty

//disable the clcok when rst1 is asserted
property clk_disable;
  @(posedge clk) $fell(rst1) |-> (!clk) intersect (!rst1);
endproperty

//check if rst1 is asserted
property rst1_assert;
 @(posedge clk) $fell(rst1) |-> status ##0 !strobe ##0 !secure_out ##0 $stable(data);
endproperty

//check if rst2  is asserted
property rst2_assert ;
  @(posedge clk) $fell(rst2) |-> data=='h00;
endproperty

//check if rst2 is deasserted
property rst2_deassert;
  int data_loc;
  @(negedge rst2) (1 , data_loc = $past(data , 1)) |-> @(posedge rst2) if(secure_out) (data =='h00)  else  (data==data_loc);
endproperty

//check data if sec is 1 and strobe is high
property data_check;
  @(posedge clk) secure_out && $rose(strobe) |->  (data=='hFF);
endproperty

//check data if secure is 0 and status is low 
property data_check_sec0;
  @(posedge clk) !secure_out && $fell(status) |->  (data=='hFF);
endproperty

//check status when secure is 0 and 
property check_status;
  @(posedge clk) !secure_out && $rose(strobe)  |-> ($past(status,6)=='b1);
endproperty


CHECK_STATUS: assert property(check_status)
            else
				$error($time, " FAIL check_status");

DATA_CHECK: assert property(data_check)
            else
				$error($time, " FAIL data check");
DATA_CHECK_SEC0: assert property(data_check_sec0)
            else
				$error($time, " FAIL data check sec0");
			  
DEF_CONDITION:assert property(def_cond)
              else
				$error($time, " FAIL def_cond");


RST1_RST2_ASSERT:assert property(rst1_rst2_assert)
              else
				$error($time, " FAIL rst1_rst2_assert");

STROBE_SIG:assert property(strobe_sig)
              else
				$error($time, " FAIL strobe_sig");

/*
CLOCK_DISABLE:assert property(clock_disable)
              else
				$error($time, " FAIL clock_disable");
*/
RST1_ASSERT:assert property(rst1_assert)
              else
				$error($time, " FAIL rst1_assert");

RST2_ASSERT:assert property(rst2_assert)
              else
				$error($time, " FAIL rst2_assert");
/*
RST1_DEASSERT:assert property(rst1_deassert)
              else
				$error($time, " FAIL rst1_deassert");
*/
RST2_DEASSERT:assert property( rst2_deassert)
              else
				$error($time, " FAIL rst2_deassert");

endmodule

