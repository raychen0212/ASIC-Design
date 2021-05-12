module rx_eop_detect (input logic d_plus, d_minus, output logic eop);
    assign eop = (d_plus == 0 && d_minus == 0) ? 1:0;
endmodule