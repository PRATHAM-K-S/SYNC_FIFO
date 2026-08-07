class sync_fifo_seq extends uvm_sequence #(sync_fifo_seq_item);
    
    // Factory registration
    `uvm_object_utils(sync_fifo_seq)

    // Handle decleration
    sync_fifo_seq_item seq_item;

    // Class constructor
    function new(string name="sync_fifo_seq");
        super.new(name);
    endfunction 

    task body();
        seq_item = sync_fifo_seq_item::type_id::create("seq_item");
        repeat(10) begin
            start_item(seq_item);
            assert(seq_item.randomize());
            finish_item(seq_item);
        end
    endtask

endclass //sync_fifo_seq extends uvm_sequence #(sync_fifo_seq_item)