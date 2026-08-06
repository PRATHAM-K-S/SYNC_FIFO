class sync_fifo_agt_cfg extends uvm_object;

    // Factory registration
    `uvm_object_utils(sync_fifo_agt_cfg)

    // Configs
    uvm_active_passive_enum is_active;
    virtual sync_fifo_if vif;

    // Class constructor
    function new(string name);
        super.new(name)
    endfunction
    
endclass //sync_fifo_agt_cfg extends uvm_object