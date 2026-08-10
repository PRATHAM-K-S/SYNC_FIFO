// Analysis implication port declerations
`uvm_analysis_imp_decl(_pred);
`uvm_analysis_imp_decl(_dut);

class sync_fifo_comp extends uvm_component;
    
    // Factory registration
    `uvm_component_utils(sync_fifo_comp)

    // Implication port declerations
    uvm_analysis_imp_pred #(sync_fifo_seq_item, sync_fifo_comp) pred_imp;
    uvm_analysis_imp_dut #(sync_fifo_seq_item, sync_fifo_comp) dut_imp;

    // Analysis FIFO declerations
    uvm_tlm_analysis_fifo #(sync_fifo_seq_item) pred_fifo;
    uvm_tlm_analysis_fifo #(sync_fifo_seq_item) dut_fifo;

    // Result variables
    int match_count = 0;
    int mismatch_count = 0;

    // Class constructor
    function new(string name="sync_fifo_comp", uvm_component parent);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        pred_imp = new("pred_imp", this);
        dut_imp = new("dut_imp", this);
        pred_fifo = new("pred_fifo", this);
        dut_fifo = new("dut_fifo", this);
    endfunction

    // Predictor write method: write_pred
    function void write_pred(sync_fifo_seq_item item);
        pred_fifo.write(item);
    endfunction

    // DUT write method: write_dut
    function void write_dut(sync_fifo_seq_item item);
        dut_fifo.write(item);
    endfunction    

    // Run phase
    task run_phase(uvm_phase phase);
        sync_fifo_seq_item pred_item, dut_item;
        forever begin
            pred_fifo.get(pred_item);
            dut_fifo.get(dut_item);
            compare_items(pred_item, dut_item);
        end
    endtask

    function void compare_items(sync_fifo_seq_item exp_item, sync_fifo_seq_item orig_item);
        
        bit error = 0;
        

        if(exp_item.data_out !== orig_item.data_out) begin
            `uvm_error("COMPARATOR", $sformatf("data_out mismatch! exp_data_out\t%0d | orig_data_out\t%0d", exp_item.data_out, orig_item.data_out))
            error = 1;
        end

        if(exp_item.full !== orig_item.full) begin
            `uvm_error("COMPARATOR", $sformatf("full_flag mismatch! exp_full\t%0d | orig_full\t%0d", exp_item.full, orig_item.full))
            error = 1;    
        end

        if(exp_item.empty !== orig_item.empty) begin
            `uvm_error("COMPARATOR", $sformatf("empty_flag mismatch! exp_empty\t%0d | orig_empty\t%0d", exp_item.empty, orig_item.empty))
            error = 1;   
        end

        if(!error) match_count++;
        else mismatch_count++;

    endfunction

endclass //sync_fifo_comp extends uvm_subscriber #(sync_fifo_seq_item)