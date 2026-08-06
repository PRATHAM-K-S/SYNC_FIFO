class sync_fifo_seqr extends uvm_sequencer #(sync_fifo_seq_item);
    
    // Factory registration
    `uvm_component_utils(sync_fifo_seqr)

    // Class constructor    
    function new(string name="sync_fifo_seqr", uvm_component parent);
        super.new(name, parent);
    endfunction

endclass //sync_fifo_seqr extends uvm_sequencer #(sync_fifo_seq_item)