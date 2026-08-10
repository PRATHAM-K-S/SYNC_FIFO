class sync_fifo_env extends uvm_env;

    // Factory registration
    `uvm_component_utils(sync_fifo_env)

    // Component handle declerations
    sync_fifo_agt act_agt;
    sync_fifo_agt pas_agt;
    sync_fifo_scr scr;
    sync_fifo_cov cov;

    // Class constructor
    function new(string name="sync_fifo_env", uvm_component parent);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        // build agents, scoreboard and coverage components
        act_agt = sync_fifo_agt::type_id::create("act_agt", this);
        pas_agt = sync_fifo_agt::type_id::create("pas_agt", this);
        scr = sync_fifo_scr::type_id::create("scr", this);
        cov = sync_fifo_cov::type_id::create("cov", this);
    endfunction

    // Connect phase
    function void connect_phase(uvm_phase phase);
        act_agt.inp_mon_ap.connect(scr.pred_axp);
        pas_agt.out_mon_ap.connect(scr.comp_axp);
    endfunction

endclass //sync_fifo_env extends uvm_env