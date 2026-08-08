class sync_fifo_scr extends uvm_scoreboard;

    // Factory registration
    `uvm_component_utils(sync_fifo_scr)

    // Handle decleration
    sync_fifo_pred pred;
    uvm_analysis_export #(sync_fifo_seq_item) pred_axp;

    // Class construction
    function new(string name="sync_fifo_scr", uvm_component parent);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        pred = sync_fifo_pred::type_id::create("pred", this);
        pred_axp = new("pred_axp", this);
    endfunction

    // Connect Phase
    function void connect_phase(uvm_phase phase);
        pred_axp.connect(pred.analysis_export);
    endfunction

endclass //sync_fifo_scr extends uvm_scoreboard