// Parameter Declarations
parameter address=7'd101; // i2c address size

parameter ADD_W  = 8 ;  // for apb
parameter DATA_W = 8 ;

// FIFO constants
parameter DATA_WIDTH = 8;
parameter ADDR_WIDTH = 3;
parameter DEPTH = 2**(ADDR_WIDTH)-1;

`include "apb_slave.sv"
`include "i2c_slave.sv"

module apb_i2c_cnv (
                    input wire scl ,
                    inout wire sda ,
//                    input  wire [7:0] data_wr ,
//                    output wire [7:0] data_rd ,          // For Master to Slave Data

                    input wire psel,                       //select slave device 
                    input wire penable,                    //enable slave device
                    input wire [ADD_W-1:0] paddr,          //address bus
                    input wire pwrite,                     //control sig : 1 = write operation , 0 = read operation
                    input wire preset,                     //active low reset
                    input wire pclk,                       //system clock
//                    input wire [DATA_W-1:0] prdata_in,     //peripheral to APB slave input bus
                    input wire [DATA_W-1:0] pwdata_in,     //APB bridge to APB slave input bus

                    output wire [DATA_W-1:0] prdata_out,   //APB slave to APB bridge output bus
//                    output wire [DATA_W-1:0] pwdata_out,   //APB slave to peripheral output bus
                    output wire pready 	                   //whether slave is ready for accepting input from either APB bridge or peripheral during write or read operation
) ;

  logic [DATA_W-1:0] prdata_in  ;
  logic [DATA_W-1:0] pwdata_out ;
  logic [7:0] data_wr ;
  logic [7:0] data_rd ;

  bit [ADDR_WIDTH-1:0] wr_pointer ;
  bit [ADDR_WIDTH-1:0] rd_pointer ;
  reg [DATA_WIDTH-1:0] mem [0:DEPTH] ;

  apb_slave apb_slv_inst (
                          .psel        (psel       ),
                          .penable     (penable    ),
                          .paddr       (paddr      ),
                          .pwrite      (pwrite     ),
                          .preset      (preset     ),
                          .pclk        (pclk       ),
                          .pwdata_out  (pwdata_out ),
                          .prdata_out  (prdata_out ),
                          .pready      (pready     ),
                          .prdata_in   (prdata_in  ),
                          .pwdata_in   (pwdata_in  )
                          ) ;

  i2c_slave i2c_slv_inst (
                          .sda      (sda     ),
                          .scl      (scl     ),
                          .data_wr  (data_wr ), 
                          .data_rd  (data_rd )
                          ) ;

  always @(negedge preset) begin
    rd_pointer = 0 ;
    wr_pointer = 0 ;
     if(!preset) begin
      rd_pointer = 0 ;
      wr_pointer = 0 ;
      foreach(mem[i])
        mem[i] = 0 ;
    end 
  end

  always @(posedge sda, negedge preset) begin
    if(!preset) begin
      rd_pointer = 0 ;
      wr_pointer = 0 ;
      foreach(mem[i])
        mem[i] = 0 ;
    end  
    else if(scl) begin
      rd_pointer++ ;
    end
  end

  always @(pwdata_out) begin
   // $display("begin wr_pointer");
    mem[wr_pointer] = pwdata_in ;
    wr_pointer = wr_pointer + 1'b1;
    //$display(wr_pointer);
  end

  assign data_wr = mem[rd_pointer] ;

endmodule
