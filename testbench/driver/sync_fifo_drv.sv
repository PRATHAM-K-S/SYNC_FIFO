class sync_fifo_drv extends uvm_driver #(sync_fifo_seq_item);

    // Factory registration
    `uvm_component_utils(sync_fifo_drv)

    // Class constructor
    function new(string name="sync_fifo_drv", uvm_component parent);
        super.new(name, parent);
    endfunction

endclass