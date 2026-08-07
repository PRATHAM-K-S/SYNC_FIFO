class sync_fifo_scr extends uvm_scoreboard;

    // Factory registration
    `uvm_component_utils(sync_fifo_scr)

    // Class construction
    function new(string name="sync_fifo_scr", uvm_component parent);
        super.new(name, parent);
    endfunction

endclass //sync_fifo_scr extends uvm_scoreboard