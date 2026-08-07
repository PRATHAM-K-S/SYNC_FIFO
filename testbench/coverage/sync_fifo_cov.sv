class sync_fifo_cov extends uvm_subscriber #(sync_fifo_seq_item);

    // Factory registration
    `uvm_component_utils(sync_fifo_cov)

    // Class constructor
    function new(string name="sync_fifo_cov", uvm_component parent);
        super.new(name, parent);
    endfunction 

    function void write(sync_fifo_seq_item item);
    endfunction

endclass //sync_fifo_cov extends uvm_subscriber #(sync_fifo_seq_item)