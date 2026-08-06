class sync_fifo_inp_mon extends uvm_monitor;

    // Factory registration
    `uvm_component_utils(sync_fifo_inp_mon)

    // Handle declerations
    virtual sync_fifo_if.INP_MON vif;

    // Class constructor
    function new(string name="sync_fifo_inp_mon", uvm_component parent);
        super.new(name, parent);
    endfunction 
    
endclass //sync_fifo_inp_mon extends uvm_monitor