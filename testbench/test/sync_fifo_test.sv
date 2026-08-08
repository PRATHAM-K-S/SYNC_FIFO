class sync_fifo_test extends uvm_test;

    // Factory registration
    `uvm_component_utils(sync_fifo_test)

    // Virtual interface handle decleration
    virtual sync_fifo_if vif;

    // Handle declerations
    sync_fifo_env env;
    sync_fifo_burst_write_seq seq1;
    sync_fifo_burst_read_seq seq2;

    // Config Handle declerations
    sync_fifo_agt_cfg act_agt_cfg;
    sync_fifo_agt_cfg pas_agt_cfg;

    // Class constructor
    function new(string name="sync_fifo_test", uvm_component parent);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);

        // get virtual interface
        if(!uvm_config_db #(virtual sync_fifo_if)::get(this, "", "vif", vif)) begin
            `uvm_fatal("NOVIF", "virtual interface not found")
        end

        // active agent config
        act_agt_cfg = sync_fifo_agt_cfg::type_id::create("act_agt_cfg");
        act_agt_cfg.is_active = UVM_ACTIVE;
        act_agt_cfg.vif = vif;
        uvm_config_db #(sync_fifo_agt_cfg)::set(this, "env.act_agt", "cfg", act_agt_cfg);

        // passive agent config
        pas_agt_cfg = sync_fifo_agt_cfg::type_id::create("pas_agt_cfg");
        pas_agt_cfg.is_active = UVM_PASSIVE; 
        pas_agt_cfg.vif = vif;
        uvm_config_db #(sync_fifo_agt_cfg)::set(this, "env.pas_agt", "cfg", pas_agt_cfg);  

        // build environment
        env = sync_fifo_env::type_id::create("env", this);

    endfunction

    // End of eloboration
    function void end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology();
    endfunction

    // Run phase
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        seq1 = sync_fifo_burst_write_seq::type_id::create("seq1");
        seq2 = sync_fifo_burst_read_seq::type_id::create("seq2");
        seq1.start(env.act_agt.seqr);
        seq2.start(env.act_agt.seqr);
        #20; //drain time
        phase.drop_objection(this);
    endtask

endclass //sync_fifo_test extends uvm_test