class sync_fifo_pred extends uvm_subscriber #(sync_fifo_seq_item);

    // Factory registration
    `uvm_component_utils(sync_fifo_pred)

    // Analysis port decleratin
    uvm_analysis_port #(sync_fifo_seq_item) ap;

    // Fifo variables
    local int fifo_depth = `RAM_DEPTH;
    local bit [`DATA_WIDTH-1:0] fifo_queue[$];

    // Pipeline registers to delay output by 1 cycle
    local bit [`DATA_WIDTH-1:0] prev_data_out;
    local bit prev_full = 0;
    local bit prev_empty = 1;
     
    // Class constructor
    function new(string name="sync_fifo_pred", uvm_component parent);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        ap = new("ap", this);
    endfunction

    // Analysis write method
    function void write(sync_fifo_seq_item seq_item_inp);
        sync_fifo_seq_item seq_item_out;
        $cast(seq_item_out, seq_item_inp.clone());
        predict_output(seq_item_out);
        ap.write(seq_item_out);
        //`uvm_info("PREDICTOR", seq_item_out.convert2string(), UVM_NONE)
    endfunction

    // Output predictor method: predict_output
    function void predict_output(input sync_fifo_seq_item item);

        // flag signals
        bit write_active = item.wr_cs && item.wr_en;
        bit read_active = item.rd_cs && item.rd_en;
        bit is_full = (fifo_queue.size() == fifo_depth);
        bit is_empty = (fifo_queue.size() == 0);
        bit rst = item.rst;

        // Assign current cycle output to previous cycle output
        item.data_out = prev_data_out;
        item.full = prev_full;
        item.empty = prev_empty;

        // fifo logic
        if(rst) begin
            item.data_out = prev_data_out;
            item.full = prev_full;
            item.empty = prev_empty;
        end
        else begin
            if(write_active && read_active) begin
                if(is_empty) begin
                    fifo_queue.push_back(item.data_in);
                end
                else begin
                    prev_data_out = fifo_queue.pop_front();
                    fifo_queue.push_back(item.data_in);
                end
            end
            else if(write_active && !is_full) begin
                fifo_queue.push_back(item.data_in);
            end
            else if(read_active && !is_empty) begin
                prev_data_out = fifo_queue.pop_front();
            end
            else begin
            // No operation to be perfomed: (FIFO in IDLE state)
            end
            // Compute flags after operations
            prev_full = (fifo_queue.size() == fifo_depth);
            prev_empty = (fifo_queue.size() == 0);
        end
    endfunction

endclass //sync_fifo_pred extends uvm_subscriber #(sync_fifo_seq_item)