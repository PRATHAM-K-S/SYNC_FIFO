class sync_fifo_out_mon extends uvm_monitor;
    
    // Factory registration
    `uvm_component_utils(sync_fifo_out_mon)

    // Handle declerations
    virtual sync_fifo_if.OUT_MON vif;
    sync_fifo_seq_item seq_item;

    // Class constructor
    function new(string name= "sync_fifo_out_mon", uvm_component parent);
        super.new(name, parent);
    endfunction

    task run_phase(uvm_phase phase);
        forever begin
            seq_item = sync_fifo_seq_item::type_id::create("seq_item");
            collect_item(seq_item);
            `uvm_info("OUT_MON", seq_item.convert2string(), UVM_NONE)
        end
    endtask

    task collect_item(input sync_fifo_seq_item seq_item);
        @(vif.out_mon_cb);
        seq_item.data_out = vif.out_mon_cb.data_out;
        seq_item.full = vif.out_mon_cb.full;
        seq_item.empty = vif.out_mon_cb.empty;
    endtask
    
endclass //sync_fifo_out_mon extends uvm_monitor