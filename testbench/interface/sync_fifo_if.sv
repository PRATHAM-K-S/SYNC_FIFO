interface sync_fifo_if(bit clk, bit rst);
    
    // Input ports
    logic wr_cs;
    logic rd_cs;
    logic wr_en;
    logic rd_en;
    logic [`DATA_WIDTH-1:0] data_in;
    
    // Output ports
    logic [`DATA_WIDTH-1:0] data_out;
    logic full;
    logic empty;

    // Driver clocking block
    clocking drv_cb @(posedge clk);
        default output #1;
        output wr_cs;
        output rd_cs;
        output wr_en;
        output rd_en;
        output data_in;
    endclocking

    // Input monitor clocking block
    clocking inp_mon_cb @(posedge clk);
        default input #1;
        input wr_cs;
        input rd_cs;
        input wr_en;
        input rd_en;
        input data_in;
    endclocking

    // Output monitor clocking block
    clocking out_mon_cb @(posedge clk);
        default input #1;
        output data_out;
        output full;
        output empty;
    endclocking

    // Modports
    modport DRV(clocking drv_cb, input rst);
    modport INP_MON(clocking inp_mon_cb, input rst);
    modport OUT_MON(clocking out_mon_cb, input rst);
    
endinterface //sync_fifo_if(bit clk, bit rst)