class sync_fifo_env extends uvm_env;

    // Factory registration
    `uvm_component_utils(sync_fifo_env)

    // Agent handle declerations
    sync_fifo_agt act_agt;
    sync_fifo_agt pas_agt;

    // Config Handle declerations
    sync_fifo_agt_cfg act_agt_cfg;
    sync_fifo_agt_cfg pas_agt_cfg;

    // Class constructor
    function new(string name="sync_fifo_env", uvm_component parent);
        super.new(name, parent)
    endfunction

    function void build_phase(uvm_phase phase);

        // active agent config
        act_agt_cfg = sync_fifo_agt::type_id::create("act_agt_cfg");
        act_agt_cfg.is_active = UVM_ACTIVE;
        uvm_config_db #(sync_fifo_agt_cfg)::set(this, "act_agt", "cfg", act_agt_cfg);

        // passive agent config
        pas_agt_cfg = sync_fifo_agt::type_id::create("pas_agt_cfg");
        pas_agt_cfg.is_active = UVM_PASSIVE; 
        uvm_config_db #(sync_fifo_agt_cfg)::set(this, "pas_agt", "cfg", pas_agt_cfg);  

        // agents
        act_agt = sync_fifo_agt::type_id::create("act_agt", this);
        pas_agt = sync_fifo_agt::type_id::create("pas_agt", this);
        
    endfunction

endclass //sync_fifo_env extends uvm_env