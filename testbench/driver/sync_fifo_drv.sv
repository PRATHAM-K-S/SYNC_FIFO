class sync_fifo_drv extends uvm_driver #(sync_fifo_seq_item);

    // Factory registration
    `uvm_component_utils(sync_fifo_drv)

    // Handle declerations
    virtual sync_fifo_if.DRV vif;
    sync_fifo_seq_item req_item;

    // Class constructor
    function new(string name="sync_fifo_drv", uvm_component parent);
        super.new(name, parent);
    endfunction

    // Run phase
    task run_phase(uvm_phase phase);
        forever begin
            seq_item_port.get_next_item(req_item);
            drive_item(req_item);
            seq_item_port.item_done();
        end
    endtask

    // Drive item
    task drive_item(input sync_fifo_seq_item req_item);
        `uvm_info("DRIVER", req_item.convert2string(), UVM_NONE);
        @(vif.drv_cb);
        vif.drv_cb.wr_cs <= req_item.wr_cs;
        vif.drv_cb.rd_cs <= req_item.rd_cs;
        vif.drv_cb.wr_en <= req_item.wr_en;
        vif.drv_cb.rd_en <= req_item.rd_en;
        vif.drv_cb.data_in <= req_item.data_in;
    endtask

endclass