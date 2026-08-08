`include "../macro/sync_fifo_macros.sv"
`include "../interface/sync_fifo_if.sv"
`include "../../design/ram_dp_ar_aw.v"
`include "../../design/syn_fifo.v"
`include "../package/sync_fifo_pkg.sv"

module sync_fifo_top;

    // Import uvm package
    import uvm_pkg::*;
    import sync_fifo_pkg::*;

    // Signal declerations
    bit clk;
    bit rst;

    // Interface decleration
    sync_fifo_if duv_if(clk, rst);

    // DUT instantiation
    syn_fifo 
    #(
        .DATA_WIDTH(`DATA_WIDTH),
        .ADDR_WIDTH(`ADDR_WIDTH),
        .RAM_DEPTH(`RAM_DEPTH)
    )
    DUT (
        .clk(clk),
        .rst(rst),
        .wr_cs(duv_if.wr_cs),
        .rd_cs(duv_if.rd_cs),
        .wr_en(duv_if.wr_en),
        .rd_en(duv_if.rd_en),
        .data_in(duv_if.data_in),
        .data_out(duv_if.data_out),
        .empty(duv_if.empty),
        .full(duv_if.full)
    );

    // Config and run_test
    initial begin
        uvm_config_db #(virtual sync_fifo_if)::set(null, "uvm_test_top", "vif", duv_if); //vif config
        run_test("sync_fifo_test"); //run_test
    end

    // Clock generator
    initial begin
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        rst = 1;
        #20;
        rst = 0;
    end

endmodule