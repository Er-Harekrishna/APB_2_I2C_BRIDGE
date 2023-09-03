
vlib work
vlog ../RTL/apb_slave.sv ../RTL/i2c_slave.sv ../RTL/dut_top.sv ../APB_I2C_ASSERTION/apb_i2c_assertion.sv ../TEST/pkg.sv ../TOP/apb_to_i2c_top.sv +incdir+../ENV +incdir+../TEST +incdir+../TEST/BASE_SEQUENCE +incdir+../TEST/B2B_WR_APB_RD_I2C +incdir+../TEST/TRANSACTION_NUMBER_IN_BEGINNING +incdir+../TEST/SEMAPHORE +incdir+../TEST/APB_READ_I2C_READ +incdir+../TEST/WRITE_APB_SAME_DATA_MULTIPLETIMES +incdir+../TEST/PSEL_HIGH_ALL_TRANSACTION  +incdir+../TEST/WR_MORE_THAN_DEPTH +incdir+../TEST/PSEL_TOGGLE_CASE +incdir+../TEST/SANITY +incdir+../TEST/APB_ONLY_READ +incdir+../TEST/APB_WR_I2C_RD_TILL_DEPTH +incdir+../TEST/APB_WR_I2C_WR +incdir+../TEST/RESET_ON_THE_FLY +incdir+../TEST/APB_WR_RST_I2C_RD +incdir+../TEST/B2B_RW_RESET 
vsim -assertdebug -novopt apb_to_i2c_top




        
