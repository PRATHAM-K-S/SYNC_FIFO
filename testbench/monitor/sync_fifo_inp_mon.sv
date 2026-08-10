class sync_fifo_inp_mon extends uvm_monitor;

    // Factory registration
    `uvm_component_utils(sync_fifo_inp_mon)

    // Handle declerations
    virtual sync_fifo_if.INP_MON vif;
    sync_fifo_seq_item seq_item;
    uvm_analysis_port #(sync_fifo_seq_item) ap;

    // Class constructor
    function new(string name="sync_fifo_inp_mon", uvm_component parent);
        super.new(name, parent);
    endfunction 

    // Build phase
    function void build_phase(uvm_phase phase);
        ap = new("ap", this);
    endfunction

    task run_phase(uvm_phase phase);
        forever begin
            seq_item = sync_fifo_seq_item::type_id::create("seq_item");
            collect_item(seq_item);
            ap.write(seq_item);
            `uvm_info("INP_MON", seq_item.convert2string(), UVM_NONE)
        end
    endtask

    task collect_item(input sync_fifo_seq_item seq_item);
        @(vif.inp_mon_cb);
        seq_item.rst = vif.rst;
        seq_item.wr_cs = vif.inp_mon_cb.wr_cs;
        seq_item.rd_cs = vif.inp_mon_cb.rd_cs;
        seq_item.wr_en = vif.inp_mon_cb.wr_en;
        seq_item.rd_en = vif.inp_mon_cb.rd_en;
        seq_item.data_in = vif.inp_mon_cb.data_in;
    endtask
    
endclass //sync_fifo_inp_mon extends uvm_monitor