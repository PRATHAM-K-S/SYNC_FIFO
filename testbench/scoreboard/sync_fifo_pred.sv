class sync_fifo_pred extends uvm_subscriber #(sync_fifo_seq_item);

    // Factory registration
    `uvm_component_utils(sync_fifo_pred)

    // Analysis port decleratin
    uvm_analysis_port #(sync_fifo_seq_item) pred_ap;
    
    // Class constructor
    function new(string name="sync_fifo_pred", uvm_component parent);
        super.new(name, parent);
    endfunction

    function void write(sync_fifo_seq_item seq_item_inp);
        sync_fifo_seq_item seq_item_out;
        $cast(seq_item_out, seq_item_inp.clone());
        `uvm_info("PREDICTOR", seq_item_out.convert2string(), UVM_NONE)
    endfunction
endclass //sync_fifo_pred extends uvm_subscriber #(sync_fifo_seq_item)