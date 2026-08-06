class sync_fifo_out_mon extends uvm_monitor;
    
    // Factory registration
    `uvm_component_utils(sync_fifo_out_mon)

    // Class constructor
    function new(string name= "sync_fifo_out_mon", uvm_component parent);
        super.new(name, parent);
    endfunction
    
endclass //sync_fifo_out_mon extends uvm_monitor