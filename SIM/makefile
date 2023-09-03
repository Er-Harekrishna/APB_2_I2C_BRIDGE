RTL = ..\RTL\apb_slave.sv ..\RTL\i2c_slave.sv ..\RTL\dut_top.sv
PKG = ..\TEST\pkg.sv
TOP = ..\TOP\apb_to_i2c_top.sv
ASSERTION = ..\APB_I2C_ASSERTION\apb_i2c_assertion.sv

INCR =  +incdir+../ENV +incdir+../TEST +incdir+../TEST/BASE_SEQUENCE +incdir+../TEST/B2B_WR_APB_RD_I2C +incdir+../TEST/TRANSACTION_NUMBER_IN_BEGINNING +incdir+../TEST/SEMAPHORE +incdir+../TEST/APB_READ_I2C_READ +incdir+../TEST/WRITE_APB_SAME_DATA_MULTIPLETIMES +incdir+../TEST/PSEL_HIGH_ALL_TRANSACTION  +incdir+../TEST/WR_MORE_THAN_DEPTH +incdir+../TEST/PSEL_TOGGLE_CASE +incdir+../TEST/SANITY +incdir+../TEST/APB_ONLY_READ +incdir+../TEST/APB_WR_I2C_RD_TILL_DEPTH +incdir+../TEST/APB_WR_I2C_WR +incdir+../TEST/RESET_ON_THE_FLY +incdir+../TEST/APB_WR_RST_I2C_RD +incdir+../TEST/B2B_RW_RESET 

TEST_1  = sanity_test
TEST_2  = same_data_case_wr_rd_test
TEST_3  = b2b_wr_apb_rd_i2c
TEST_4  = wr_more_than_depth_case_wr_rd_test
TEST_5  = semaphore_case_wr_rd_test
TEST_6  = apb_psel_high_all_transaction_case_test
TEST_7  = apb_psel_toggle_all_transaction_case_test
TEST_8  = apb_wr_i2c_rd_till_depth_test
TEST_9  = apb_read_i2c_read_case_wr_rd_test
TEST_10 = apb_only_read_test
TEST_11 = apb_wr_i2c_wr_test
TEST_12 = reset_on_the_fly_test
TEST_13 = apb_pwdata_change_cb_test
TEST_14 = i2c_stop_cond_cb_test
TEST_15 = apb_wr_rst_i2c_rd_test
TEST_16 = b2b_rw_reset_test

TOP_NAME = apb_to_i2c_top

COVERAGE = -c -do "coverage save -onexit -directive -cvg -codeall

vlog:
	vlog $(RTL) $(ASSERTION) $(PKG) $(TOP) $(INCR)

qverilog :
	qverilog $(RTL) $(ASSERTION) $(PKG) $(TOP) $(INCR)
	
vsim: vlog 
	vsim -novopt $(TOP_NAME)
	
regression: 
	vlog -coveropt 3 +cover +acc $(RTL) $(ASSERTION) $(PKG) $(TOP) $(INCR)
	vsim -coverage -vopt $(TOP_NAME) $(COVERAGE) $(TEST_1).ucdb; run -all; exit" +UVM_TESTNAME=$(TEST_1)
	vsim -coverage -vopt $(TOP_NAME) $(COVERAGE) $(TEST_2).ucdb; run -all; exit" +UVM_TESTNAME=$(TEST_2)
	vsim -coverage -vopt $(TOP_NAME) $(COVERAGE) $(TEST_3).ucdb; run -all; exit" +UVM_TESTNAME=$(TEST_3)
	vsim -coverage -vopt $(TOP_NAME) $(COVERAGE) $(TEST_4).ucdb; run -all; exit" +UVM_TESTNAME=$(TEST_4)
	vsim -coverage -vopt $(TOP_NAME) $(COVERAGE) $(TEST_5).ucdb; run -all; exit" +UVM_TESTNAME=$(TEST_5)
	vsim -coverage -vopt $(TOP_NAME) $(COVERAGE) $(TEST_6).ucdb; run -all; exit" +UVM_TESTNAME=$(TEST_6)
	vsim -coverage -vopt $(TOP_NAME) $(COVERAGE) $(TEST_7).ucdb; run -all; exit" +UVM_TESTNAME=$(TEST_7)
	vsim -coverage -vopt $(TOP_NAME) $(COVERAGE) $(TEST_8).ucdb; run -all; exit" +UVM_TESTNAME=$(TEST_8)
	vsim -coverage -vopt $(TOP_NAME) $(COVERAGE) $(TEST_9).ucdb; run -all; exit" +UVM_TESTNAME=$(TEST_9)
	vsim -coverage -vopt $(TOP_NAME) $(COVERAGE) $(TEST_10).ucdb; run -all; exit" +UVM_TESTNAME=$(TEST_10)
	vsim -coverage -vopt $(TOP_NAME) $(COVERAGE) $(TEST_11).ucdb; run -all; exit" +UVM_TESTNAME=$(TEST_11)
	vsim -coverage -vopt $(TOP_NAME) $(COVERAGE) $(TEST_12).ucdb; run -all; exit" +UVM_TESTNAME=$(TEST_12)
	vsim -coverage -vopt $(TOP_NAME) $(COVERAGE) $(TEST_13).ucdb; run -all; exit" +UVM_TESTNAME=$(TEST_13)
	vsim -coverage -vopt $(TOP_NAME) $(COVERAGE) $(TEST_14).ucdb; run -all; exit" +UVM_TESTNAME=$(TEST_14)
	vsim -coverage -vopt $(TOP_NAME) $(COVERAGE) $(TEST_15).ucdb; run -all; exit" +UVM_TESTNAME=$(TEST_15)
	vsim -coverage -vopt $(TOP_NAME) $(COVERAGE) $(TEST_16).ucdb; run -all; exit" +UVM_TESTNAME=$(TEST_16)
	vcover merge APB2I2C_regression.ucdb $(TEST_1).ucdb  $(TEST_2).ucdb $(TEST_3).ucdb $(TEST_4).ucdb $(TEST_5).ucdb $(TEST_6).ucdb $(TEST_7).ucdb $(TEST_8).ucdb $(TEST_9).ucdb $(TEST_10).ucdb $(TEST_11).ucdb $(TEST_12).ucdb $(TEST_13).ucdb $(TEST_14).ucdb $(TEST_15).ucdb $(TEST_16).ucdb
	vcover report -html -htmldir APB2I2C_regression APB2I2C_regression.ucdb 
