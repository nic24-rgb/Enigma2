module clock(
    input clk,
    input rst_n,
	input Phi2,
    output cpu_clken
    );

wire ff1_out;

ls74 LS74
(
  .pre_n(1'b1),
  .clr_n(1'b1),
  .clk(clk),
  .d(Phi2),
  .q(ff1_out),
  .q_n()
);

wire int1 = (Phi2 ^ ff1_out);
assign cpu_clken = (Phi2 & int1);

endmodule
