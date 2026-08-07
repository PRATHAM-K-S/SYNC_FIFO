class sync_fifo_agt extends uvm_agent;

    // Factory registration
    `uvm_component_utils(sync_fifo_agt)

    // Handle declerations
    sync_fifo_seqr seqr;
    sync_fifo_drv drv; 
    sync_fifo_inp_mon inp_mon;
    sync_fifo_out_mon out_mon;
    sync_fifo_agt_cfg cfg;

    // Class constructor
    function new(string name="sync_fifo_agt", uvm_component parent);
        super.new(name, parent);
    endfunction 

    // Build phase
    function void build_phase(uvm_phase phase);
        // get config object
        if(!uvm_config_db #(sync_fifo_agt_cfg)::get(this, "", "cfg", cfg)) begin
            `uvm_fatal("AGT_CFG", "Failed to get config object")
        end

        // build agent components dynamically
        if(cfg.is_active == UVM_ACTIVE) begin
            seqr = sync_fifo_seqr::type_id::create("seqr", this);
            drv = sync_fifo_drv::type_id::create("drv", this);
            inp_mon = sync_fifo_inp_mon::type_id::create("inp_mon", this);
        end
        else begin
            out_mon = sync_fifo_out_mon::type_id::create("out_mon",this);
        end
    endfunction

    // Connect phase
    function void connect_phase(uvm_phase phase);
        // virtual interface configuration
        if(cfg.is_active == UVM_ACTIVE) begin
            drv.vif = cfg.vif;
            inp_mon.vif = cfg.vif;
            drv.seq_item_port.connect(seqr.seq_item_export);
        end
        else begin
            out_mon.vif = cfg.vif;
        end
    endfunction

endclass //sync_fifo_agt extends uvm_agent