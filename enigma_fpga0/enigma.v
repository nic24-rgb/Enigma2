module enigma_fpga(
	input FPGA_CLK1_50,
	output VGA_HS,
	output VGA_VS,
	output	[5:0]VGA_R,
	output	[5:0]VGA_G,
	output	[5:0]VGA_B,
	input BTN_RESET,
	output o_M5Hz,
	output [3:0] o_cnt0,
	output [1:0] o_cnt1,
	output [7:0] o_cnt2,
	output o_clk_en0,
	output o_clk_en1,
	output o_clk_en2,
	output o_clk
);

assign o_M5Hz = M5Hz;
assign o_cnt0 = cnt0;
assign o_cnt1 = cnt1;
assign o_cnt2 = cnt2;
assign o_clk_en0 = clk_en0;
assign o_clk_en1 = clk_en1;
assign o_clk_en2 = clk_en2;
assign o_clk = clk;

//assign vout = VBLANK_n;

//power-on reset
reg [5:0] reset_cnt = 0;
wire RESET_PO_n = &reset_cnt;
always @(posedge clk) begin
    reset_cnt <= reset_cnt + !RESET_PO_n;
end

wire RESET_n = (RESET_PO_n & BTN_RESET);//(RESET_PO_n & BTN_RESET)
wire PUR = RESET_n;
//end power-on reset
//start of clk pll

wire clk;

clk_pll clk1(
		.refclk(FPGA_CLK1_50),
		.rst(),      //removed ~nRESET for power-on reset
		.outclk_0(clk)
	);

//end of clk pll
//counters

wire M5Hz,M5Hz_n;
wire H2,H4,H8,H16,H32,H64,H128,H256;
wire V2,V4,V8,V16,V32,V64,V128,V256;

  ls107 ic2A(
   .clr_n(PUR), 
   .clk(~clk), 
   .j(PUR), 
   .k(PUR), 
   .q(M5Hz), 
   .q_n(M5Hz_n)
  );

reg [1:0] cnt1 = 2'b00;
always @(posedge clk)
	if (!PUR)
		cnt1 <= 2'b00;
	else
		cnt1 <= cnt1 + 2'd1;
		
wire M5Hz_en = cnt1[1:0] == 2'b00;
wire clk_en = ~cnt1[0];

reg [3:0] cnt0 = 4'b0000;
always @(posedge FPGA_CLK1_50)
	if (cnt0 == 4'd9)
		cnt0 <= 4'd0;
	else 
		cnt0 <= cnt0 + 4'd1;

wire clk_en0 = cnt0[3:0] == 4'b1001;
wire clk_en2 = (cnt0[3:0] == 4'b1001) | (cnt0[3:0] == 4'b0100);

reg clk_en1 = 1'b0;
always @(posedge FPGA_CLK1_50) clk_en1 <= clk_en2 & ~clk_en0;

//reg clk_en1 = 1'b0;
//always @(posedge FPGA_CLK1_50) begin
//	if (FPGA_CLK1_50 & clk & M5Hz)
//		clk_en1 <= 1'b1;
//	else
//		clk_en1 <= 1'b0;
//end
//wire clk_en1 = (FPGA_CLK1_50 & M5Hz);

//reg [8:0] hcnt = 9'd0;
//always @(posedge M5Hz)
//begin
//	hcnt = hcnt + 9'b1;
//end
//wire ce_5M = M5Hz;
//reg flip = 1'b1;
//reg h_sync_last = 1'b0;
//reg ce_5M_last = 1'b0;
//reg s_1h_last = 1'b0;
//reg	h_sync = 1'b0;
//reg	v_sync = 1'b0;
//reg	h_blank = 1'b0;
//reg	v_blank = 1'b0;
//reg [2:0] nib = 3'd0;
//reg [7:0] shcnt = 8'd0;
//reg [8:0] hcnt = 9'd0;
//reg [7:0] vcnt = 8'd0;
//reg [12:0] vidcnt = 10'd0;
//reg [12:0] rvidcnt = 10'd0;
//
//always @(posedge clk)
//begin
//
//	///// HORIZONTAL COUNTER AND SYNC
//	if(ce_5M == 1'b1)
//	begin
//		hcnt <= hcnt + 9'b1;
//		nib <= nib + 3'b1;
//		if(nib == 4'd7) begin
//			if(h_blank)
//				shcnt <= 8'd0;
//			else
//				shcnt <= shcnt + 8'b1;
//		end
//		begin
//			case (hcnt)
//				256:	h_blank <= 1;
//				260:	h_sync <= 1;
//				288:	h_sync <= 0;
//				319:	
//				begin
//					hcnt <= 0;
//					h_blank <=0;
//				end
//			endcase
//		end
//		///// VERTICAL COUNTER AND SYNC
//		if (h_sync == 1'b1 && h_sync_last == 1'b0) begin
//			if(flip)
//				vcnt <= vcnt + 8'b1;
//			else
//				vcnt <= vcnt - 8'b1;
//		end
//		h_sync_last <= h_sync;
//		
//		case (vcnt)
//			0:	v_blank <= flip;
//			25:	v_blank <= ~flip; 
//			4:	if(flip) v_sync <= 1;
//			8:	if(flip) v_sync <= 0;
//			20:	if(~flip) v_sync <= 1;
//			16:	if(~flip) v_sync <= 0;
//		endcase
//	end
//
//	ce_5M_last <= ce_5M;
//	vidcnt <= {vcnt[7:0],shcnt[4:0]};
//	rvidcnt <= 14'h231F - vidcnt;
//
//end


wire H1,H1_n;

  ls74_2 ic3A_1(
	.pre_n(PUR),
	.clr_n(PUR),
	.clk(clk),
	.clk_en(clk_en),
	.d(H1_n),
	.q(H1),
    .q_n(H1_n)
  );

wire A4_rco;

  ls161_2 ic4A(
	.clr_n(PUR),
	.clk(clk),
	.clk_en(M5Hz_en),
	.din(4'b0000),
	.enp(H1),
	.ent(H1),
	.load_n(PUR),
	.q({H16,H8,H4,H2}),
	.rco(A4_rco)
  );

wire A5_rco;

  ls161_2 ic5A(
	.clr_n(PUR),
	.clk(clk),
	.clk_en(M5Hz_en),
	.din(4'b0110),
	.enp(A4_rco),
	.ent(A4_rco),
	.load_n(~A5_rco),
	.q({H256,H128,H64,H32}),
	.rco(A5_rco)
  );

wire A8_x = ~(H16 | H8);
wire A9_x = (A8_x | H32);
wire HSYNC = (A9_x | H256);

wire V1,A3_2_q_n;

reg [7:0] cnt2 = 8'b00000000;
always @(posedge clk)
	if (!PUR)
		cnt2 <= 8'b00000000;
	else 
		if (HSYNC)
			cnt2 <= 8'b00000000;
		else
			cnt2 <= cnt2 + 2'd1;
			
wire HSYNC_en = cnt2[7:0] == 8'b00101111;

  ls74_2 ic3A_2(
	.pre_n(PUR),
	.clr_n(PUR),
	.clk(clk),
	.clk_en(HSYNC_en),
	.d(A3_2_q_n),
	.q(V1),
    .q_n(A3_2_q_n)
  );

wire A6_rco;
wire A7_rco;

  ls161_2 ic6A(
	.clr_n(PUR),
	.clk(clk),
	.clk_en(HSYNC_en),
	.din(4'b1100),
	.enp(V1),
	.ent(V1),
	.load_n(~A7_rco),
	.q({V16,V8,V4,V2}),
	.rco(A6_rco)
  );

  ls161_2 ic7A(
	.clr_n(PUR),
	.clk(clk),
	.clk_en(HSYNC_en),
	.din(4'b0110),
	.enp(A6_rco),
	.ent(A6_rco),
	.load_n(~A7_rco),
	.q({V256,V128,V64,V32}),
	.rco(A7_rco)
  );

wire A10_6 = ~(V32 | V64 | V128);
wire VBLANK_n = ~(~V256 | A10_6);
wire A10_8 = ~(V8 | V16 | V256);
wire VSYNC = ~A10_8;
wire COMPSYNC = (VSYNC & HSYNC);
wire B17_8 = ~(M5Hz_n & H1 & H2);//
wire LOAD_n = (B17_8 | H4);
wire LOAD = ~LOAD_n;

//end of counters
//Addressing

reg INV = 1'b1;//temp reg 0
//wire INV;
wire [12:0] inv_in = {13{INV}};
wire [12:0] scrn_count_in = {V128,V64,V32,V16,V8,V4,V2,V1,H128,H64,H32,H16,H8};
wire [12:0] scrn_count_out = (scrn_count_in ^ inv_in);
wire [3:0] A16_out;

//wire [13:0] VRA = {1'b1,scrn_count_out[12:0]}; - try to do away with this

  ls283 ic16A(
	.a({1'b0,scrn_count_out[12:10]}),
	.b({3'b000,INV}),
	.c_in(1'b0),
	.sum(A16_out),
	.c_out()
  );

//wire WRpri_n = (WR_n | MREQ_n);
wire [3:0] B16_out;

reg A_13 = 1'b0;
wire RWRpri_n = B16_out[3];
wire D17_1_q;
wire A13star = (A_13 & D17_1_q);//A[13]

  ls157 ic16B(
	.i0({1'b1,1'b0,1'b0,A16_out[2]}),
	.i1(),//{WRpri_n,1'b0,MREQ_n,A[12]}
	.e_n(1'b0),
	.s(A13star),
	.z(B16_out)
  );

wire [3:0] B15_out;

  ls157 ic15B(
	.i0({A16_out[1:0],scrn_count_out[9:8]}),
	.i1(),
	.e_n(1'b0),
	.s(A13star),
	.z(B15_out)
  );

wire [3:0] B14_out;

  ls157 ic14B(
	.i0(scrn_count_out[7:4]),
	.i1(),
	.e_n(1'b0),
	.s(A13star),
	.z(B14_out)
  );

wire [3:0] B13_out;

  ls157 ic13B(
	.i0(scrn_count_out[3:0]),
	.i1(),
	.e_n(1'b0),
	.s(A13star),
	.z(B13_out)
  );

wire RAM7_d,RAM6_d,RAM5_d,RAM4_d,RAM3_d,RAM2_d,RAM1_d,RAM0_d;
wire [1:0] B12_out;

  ls42 ic12B(
    .in({B16_out[1:0],B15_out[3:2]}),
    .out({B12_out,RAM7_d,RAM6_d,RAM5_d,RAM4_d,RAM3_d,RAM2_d,RAM1_d,RAM0_d})
  );

wire [9:0] RA = {B15_out[1:0],B14_out[3:0],B13_out[3:0]};

wire A15_11 = (1'b1 ^ H4);
wire C17_6 = (A15_11 & RESET_n);


  ls74 ic17D_1(
	.pre_n(C17_6),
	.clr_n(PUR),
	.clk(H2),
	.d(H4),
	.q(D17_1_q),
    .q_n()
  );

//end of addressing
//ROMs

//wire [7:0] rom0_dout,rom1_dout,rom2_dout,rom3_dout,rom4_dout,rom5_dout;

//end of ROMs
//video

wire STARENV = (V1 & V2 & V4 & V8);
wire F17_6 = (H1 & H2 & H4 & H8);
wire F14_11 = (STARENV & F17_6);

wire VERTBLANK_n = VBLANK_n;
wire G15_3 = (VERTBLANK_n & H256);

wire D18_q,B18_q;
wire [7:0] VRAM_dout;
wire [7:0] VRAM_dout_rev = {VRAM_dout[0],VRAM_dout[1],VRAM_dout[2],VRAM_dout[3],VRAM_dout[4],VRAM_dout[5],VRAM_dout[6],VRAM_dout[7]};

wire pixclk;

   ls165_2 ic18D(
    .clk(clk),//M5Hz_n pixclk
	.clk_en(clk_en),
    .load(LOAD_n),//LOAD_n
    .in(VRAM_dout_rev),//VRAM_dout
    .out(D18_q)
   );
   
   ls165_2 ic18B(
    .clk(clk),//pixclk M5Hz
	.clk_en(clk_en),
    .load(LOAD_n),
    .in(VRAM_dout),//VRAM_dout_rev
    .out(B18_q)
   );

wire VIDEO = INV? B18_q : D18_q;
wire VID1 = (G15_3 & VIDEO);
wire [7:0] rom6_dout, rom7_dout;

wire [10:0] col_add = {INV,V128,V64,V32,V16,V8,H128,H64,H32,H16,H8};

wire sparkle;
reg [5:0] cnt = 6'b00000;

always @(posedge V256) begin
	cnt <= cnt + 1;
end
assign sparkle = cnt[5];
dpram #(11,8,"rom6.txt") ic11F_ROM6 //side a cpu, side b loading
(
	.clock_a(clk),
	.wren_a(),
	.address_a(col_add),
	.data_a(),
	.q_a(rom6_dout),
	.clock_b(),
	.wren_b(),
	.address_b(),
	.data_b(),
	.q_b()
);

wire [10:0] star_add = {sparkle,V128,V64,V32,V16,INV,H128,H64,H32,H16,H8};

dpram #(11,8,"rom7.txt") ic12F_ROM7 //side a cpu, side b loading
(
	.clock_a(clk),
	.wren_a(),
	.address_a(star_add),//1'b0 is a test //INV
	.data_a(),												//probably create a clock
	.q_a(rom7_dout),
	.clock_b(),
	.wren_b(),
	.address_b(),
	.data_b(),
	.q_b()
);

wire [5:0] G11_q;

   ls174 ic11G(
	.d(rom6_dout[5:0]),
	.clk(LOAD_n),
	.mr(PUR),
	.q(G11_q)
   );

wire G12_3 = (G11_q[0] & VID1);
wire G12_6 = (G11_q[1] & VID1);
wire G12_8 = (G11_q[2] & VID1);

wire F14_3 = (rom7_dout[0] & F14_11);
wire F14_6 = (rom7_dout[1] & F14_11);
wire F14_8 = (rom7_dout[2] & F14_11);

wire G13_outblnk;
wire RED,GREEN,BLUE;

  ls157 ic13G( //A & B may be reversed
	.i0({1'b0,F14_8,F14_6,F14_3}),//{1'b0,G12_8,G12_6,G12_3}
	.i1({1'b0,G12_8,G12_6,G12_3}),//{1'b0,F14_8,F14_6,F14_3}
	.e_n(1'b0),
	.s(VID1),
	.z({G13_outblnk,RED,GREEN,BLUE})
  );

//end of video
//RAM

wire [7:0] ram0_dout,ram1_dout,ram2_dout,ram3_dout,ram4_dout,ram5_dout,ram6_dout,ram7_dout;
wire [7:0] vram0_dout,vram1_dout,vram2_dout,vram3_dout,vram4_dout,vram5_dout,vram6_dout,vram7_dout;

dpram #(10,8,"ram0.txt") ic4C_RAM0  //side a cpu, side b loading - 11
(
	.clock_a(),//	.clock_a(clk)
	.wren_a(),//	.wren_a(~WR_n & ~RAM0_n)
	.address_a(),//	.address_a({1'b0,A[9:0]})
	.data_a(),//	.data_a(cpudata_out)
	.q_a(),//	.q_a(ram0_dout)
	.clock_b(clk),
	.wren_b(1'b0),
	.address_b(RA[9:0]),//RA[9:0]
	.data_b(),
	.q_b(vram0_dout)
);

dpram #(10,8,"ram1.txt") ic5C_RAM1  //side a cpu, side b loading
(
	.clock_a(),
	.wren_a(),
	.address_a(),
	.data_a(),
	.q_a(),
	.clock_b(clk),
	.wren_b(1'b0),
	.address_b(RA[9:0]),
	.data_b(),
	.q_b(vram1_dout)
);

dpram #(10,8,"ram2.txt") ic6C_RAM2  //side a cpu, side b loading
(
	.clock_a(),
	.wren_a(),
	.address_a(),
	.data_a(),
	.q_a(),
	.clock_b(clk),
	.wren_b(1'b0),
	.address_b(RA[9:0]),
	.data_b(),
	.q_b(vram2_dout)
);

dpram #(10,8,"ram3.txt") ic7C_RAM3  //side a cpu, side b loading
(
	.clock_a(),
	.wren_a(),
	.address_a(),
	.data_a(),
	.q_a(),
	.clock_b(clk),
	.wren_b(1'b0),
	.address_b(RA[9:0]),
	.data_b(),
	.q_b(vram3_dout)
);

dpram #(10,8,"ram4.txt") ic8C_RAM4  //side a cpu, side b loading
(
	.clock_a(),
	.wren_a(),
	.address_a(),
	.data_a(),
	.q_a(),
	.clock_b(clk),
	.wren_b(1'b0),
	.address_b(RA[9:0]),
	.data_b(),
	.q_b(vram4_dout)
);

dpram #(10,8,"ram5.txt") ic9C_RAM5  //side a cpu, side b loading
(
	.clock_a(),
	.wren_a(),
	.address_a(),
	.data_a(),
	.q_a(),
	.clock_b(clk),
	.wren_b(1'b0),
	.address_b(RA[9:0]),
	.data_b(),
	.q_b(vram5_dout)
);

dpram #(10,8,"ram6.txt") ic10C_RAM6  //side a cpu, side b loading
(
	.clock_a(),
	.wren_a(),
	.address_a(),
	.data_a(),
	.q_a(),
	.clock_b(clk),
	.wren_b(1'b0),
	.address_b(RA[9:0]),
	.data_b(),
	.q_b(vram6_dout)
);

dpram #(10,8,"ram7.txt") ic10C_RAM7  //side a cpu, side b loading
(
	.clock_a(),
	.wren_a(),
	.address_a(),
	.data_a(),
	.q_a(),
	.clock_b(clk),
	.wren_b(1'b0),
	.address_b(RA[9:0]),
	.data_b(),
	.q_b(vram7_dout)
);

//end of RAM
//addressing 2

//wire VRAM0_n = ~(rvidcnt[12:10] == 3'b000);
//wire VRAM1_n = ~(rvidcnt[12:10] == 3'b001);
//wire VRAM2_n = ~(rvidcnt[12:10] == 3'b010);
//wire VRAM3_n = ~(rvidcnt[12:10] == 3'b011);
//wire VRAM4_n = ~(rvidcnt[12:10] == 3'b100);
//wire VRAM5_n = ~(rvidcnt[12:10] == 3'b101);
//wire VRAM6_n = ~(rvidcnt[12:10] == 3'b110);
//wire VRAM7_n = ~(rvidcnt[12:10] == 3'b111);

//end of addressing 2
//start of Address muxing

assign VRAM_dout =  !RAM0_d ? vram0_dout :
					!RAM1_d ? vram1_dout :
					!RAM2_d ? vram2_dout :
					!RAM3_d ? vram3_dout :
					!RAM4_d ? vram4_dout :
					!RAM5_d ? vram5_dout :
					!RAM6_d ? vram6_dout :
					!RAM7_d ? vram7_dout :
					8'h00;


//end of Address muxing
//jtframe hsize

reg [3:0] scale = 4'h8;
wire RED_o,GREEN_o,BLUE_o;
wire HS,VS,HB,VB;

jtframe_hsize hsize(
    .clk(FPGA_CLK1_50),
    .pxl_cen(clk_en1),
    .pxl2_cen(clk_en2),
    .scale(scale),
    .offset(5'd0),
    .enable(1'b0),

    .r_in(RED),
    .g_in(GREEN),
    .b_in(BLUE),
    .HS_in(HSYNC),
    .VS_in(VSYNC),
    .HB_in(H256),
    .VB_in(VBLANK_n),
    // filtered video
    .HS_out(HS),
    .VS_out(VS),
    .HB_out(HB),
    .VB_out(VB),
    .r_out(RED_o),
    .g_out(GREEN_o),
    .b_out(BLUE_o)
);


//end of hsize
//start of video out

wire COMPSYNC_o = (VS & HS);

  assign VGA_R = {6{RED_o}};//{6{RED}};
  assign VGA_G = {6{GREEN_o}};
  assign VGA_B = {6{BLUE_o}};
  assign VGA_HS = COMPSYNC_o;
  
//end of video out
endmodule 