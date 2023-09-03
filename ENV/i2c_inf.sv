//------------------------------------------------------------------------------------------------------------------//
// FILE NAME       : i2c_inf.sv 
// AUTHOR          : Harekrishna ray
// MODIFIED DATE   : 20/02/23
// DESCRIPTION     : file contains the interface for the i2c master 
//------------------------------------------------------------------------------------------------------------------//
interface i2c_inf(input bit scl);
 
//port declaration 
 wire sda;
 logic sda_out ='z;
 assign sda = sda_out;

//modports
 modport I2C_STR_STP (output sda_out,input sda,input scl);
 modport I2C_WDR_MP  (output sda_out,input sda,input scl);

 endinterface
 
 
