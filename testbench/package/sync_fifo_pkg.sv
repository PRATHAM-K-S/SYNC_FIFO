package sync_fifo_pkg;

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    `include "../sequence/sync_fifo_seq_item.sv"
    `include "../config/sync_fifo_agt_cfg.sv"
    `include "../driver/sync_fifo_drv.sv"
    `include "../monitor/sync_fifo_inp_mon.sv"
    `include "../monitor/sync_fifo_out_mon.sv"
    `include "../sequencer/sync_fifo_seqr.sv"
    `include "../agent/sync_fifo_agt.sv"
    `include "../environment/sync_fifo_env.sv"
    `include "../test/sync_fifo_test.sv"
    
endpackage