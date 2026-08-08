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
        $sformat(s, "%s\n wr_cs \t%0d\n rd_cs \t%0d\n wr_en \t%0d\n rd_en \t%0d\n data_in \t%0d\n data_out \t%0d\n full \t%0d\n empty \t%0d\n",
        s, wr_cs, rd_cs, wr_en, rd_en, data_in, data_out, full, empty);
        return s;
    endfunction

    // do_copy method
    function void do_copy(uvm_object rhs);
        sync_fifo_seq_item rhs_;
        if(!$cast(rhs_, rhs)) begin
            `uvm_error("COPY", "cast failed")
            return;
        end
        super.do_copy(rhs);
        wr_cs = rhs_.wr_cs;
        rd_cs = rhs_.rd_cs;
        wr_en = rhs_.wr_en;
        rd_en = rhs_.rd_en;
        data_in = rhs_.data_in;
        data_out = rhs_.data_out;
        full = rhs_.full;
        empty = rhs_.empty;
    endfunction

endclass