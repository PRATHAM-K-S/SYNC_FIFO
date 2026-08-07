class sync_fifo_seq extends uvm_sequence #(sync_fifo_seq_item);
    
    // Factory registration
    `uvm_object_utils(sync_fifo_seq)

    // Class constructor
    function new(string name="sync_fifo_seq");
        super.new(name)
    endfunction 

    task body();
        req = sync_fifo_seq_item::type_id::create("req");
        repeat(10) begin
            start_item(req);
            assert(req.randomize());
            finish_item(req);
        end
    endtask

endclass //sync_fifo_seq extends uvm_sequence #(sync_fifo_seq_item)