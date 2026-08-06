class sync_fifo_env extends uvm_env;

    // Factory registration
    `uvm_component_utils(sync_fifo_env)

    // Agent handle declerations
    sync_fifo_agt act_agt;
    sync_fifo_agt pas_agt;

    // Class constructor
    function new(string name="sync_fifo_env", uvm_component parent);
        super.new(name, parent)
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        // build agents
        act_agt = sync_fifo_agt::type_id::create("act_agt", this);
        pas_agt = sync_fifo_agt::type_id::create("pas_agt", this);
    endfunction

endclass //sync_fifo_env extends uvm_env