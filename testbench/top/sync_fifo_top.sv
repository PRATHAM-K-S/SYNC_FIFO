module sync_fifo_top;

    // Import uvm package
    import uvm_pkg::*;

    // Signal declerations
    bit clk;
    bit rst;

    // Interface decleration
    sync_fifo_if duv_if(clk, rst);

    initial begin
        uvm_config_db #(virtual sync_fifo_if)::set(null, "uvm_test_top", "vif", duv_if); //vif config
        run_test("sync_fifo_test"); //run_test
    end

endmodule