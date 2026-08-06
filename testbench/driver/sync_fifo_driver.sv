class sync_fifo_driver extends uvm_driver #(sync_fifo_seq_item);

    // Factory registration
    `uvm_component_utils(sync_fifo_driver)

    // Class constructor
    function new(string name="sync_fifo_driver", uvm_component parent);
        super.new(name, parent);
    endfunction

endclass