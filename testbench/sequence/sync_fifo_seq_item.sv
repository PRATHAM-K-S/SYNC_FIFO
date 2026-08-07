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

    // convert2string method
    function string convert2string();
        string s;
        s = super.convert2string();
        $sformat(s, "%s\n wr_cs \t%0b\n rd_cs \t%0b\n wr_en \t%0b\n rd_en \t%0b\n data_in \t%0d\n data_out \t%0d\n full \t%0b\n empty \t%0b\n",
        s, wr_cs, rd_cs, wr_en, rd_en, data_in, data_out, full, empty);
        return s;
    endfunction

endclass