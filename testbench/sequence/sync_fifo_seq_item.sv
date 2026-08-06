class sync_fifo_seq_item extends uvm_sequence_item;

    // Factory registration
    `uvm_object_utils(sync_fifo_seq_item)

    // Input signals
    rand bit wr_cs;
    rand bit rd_cs;
    rand bit wr_en;
    rand bit rd_en;
    rand bit [`DATA_WIDTH-1:0] data_in;
    
    // Output signals
    bit [`DATA_WIDTH-1:0] data_out;
    bit full;
    bit empty;

    // Class constructor
    function new(string name="sync_fifo_seq_item");
        super.new(name);
    endfunction

endclass