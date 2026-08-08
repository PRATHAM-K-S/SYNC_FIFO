class sync_fifo_burst_write_seq extends uvm_sequence #(sync_fifo_seq_item);
    
    // Factory registration
    `uvm_object_utils(sync_fifo_burst_write_seq)

    // Handle declerations
    sync_fifo_seq_item seq_item;

    // protected variables
    protected int num_writes = `RAM_DEPTH + 2;

    // Class constructor
    function new(string name="sync_fifo_burst_write_seq");
        super.new(name);
    endfunction

    // Sequence generator
    task body();
        repeat(num_writes) begin
            seq_item = sync_fifo_seq_item::type_id::create("seq_item");
            start_item(seq_item);
            if(!seq_item.randomize() with {
                wr_cs == 1'b1;
                wr_en == 1'b1;
                rd_cs == 1'b0;
                rd_en == 1'b0;
            }) begin
                `uvm_error("body", "randomization failed")
            end
            finish_item(seq_item);
        end
    endtask

endclass //sync_fifo_burst_write_seq extends uvm_sequence #(sync_fifo_seq_item)