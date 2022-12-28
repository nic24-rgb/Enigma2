module enigma_fpga(
	input CLK50M,
	input clk,
	output RED,
	output GREEN,
	output BLUE,
	output H_SYNC,
	output V_SYNC,
	output H_BLANK,
	output V_BLANK,
	input RESET_n_in,
	input [9:0] CONTROLS,
	input [7:0] DIP,
	input [14:0] dn_addr,
	input [7:0] dn_data,
	input dn_wr

);

assign H_SYNC = ~HSYNC;
assign V_SYNC = ~VSYNC;
assign H_BLANK = ~H256;
assign V_BLANK = ~VBLANK_n;

wire m_right  = CONTROLS[0];
wire m_left   = CONTROLS[1];
wire m_down   = CONTROLS[2];
wire m_up     = CONTROLS[3];
wire m_shoot  = CONTROLS[4];
wire m_start1p  = CONTROLS[5];
wire m_start2p  = CONTROLS[6];
wire m_coin   = CONTROLS[7];
wire m_thrust   = CONTROLS[8];

//power-on reset
reg [5:0] reset_cnt = 0;
wire RESET_PO_n = &reset_cnt;
always @(posedge clk) begin
    reset_cnt <= reset_cnt + !RESET_PO_n;
end

wire RESET_n = (RESET_PO_n & RESET_n_in);//(RESET_PO_n & BTN_RESET)  (RESET_PO_n & RESET_n_in)
wire PUR = RESET_n;
//end power-on reset
//start of clk pll

//wire clk;

//clk_pll clk1(
//		.refclk(FPGA_CLK1_50),
//		.rst(),      //removed ~nRESET for power-on reset
//		.outclk_0(clk)
//	);

//end of clk pll
//temp

wire [15:0] A;
wire [7:0] cpudata_in,cpudata_out;
wire MREQ_n;
wire MAQ_n = MREQ_n;
wire IORQ_n;
wire WR_n;
wire RD_n;
wire M1_n;
reg NMI_n = 1'b1;
reg [7:0] DIPSW = 8'b01000000;
reg [7:0] IN0 = 8'b00000000;
reg [7:0] IN1 = 8'b00000000;

wire [7:0] IN0_act = {1'b0,~m_right,~m_left,~m_shoot,~m_thrust,~m_start1p,~m_start2p,~m_coin};
//wire [7:0] IN0_act = {IN0[7],m_left,m_right,m_shoot,~m_service,m_start1p,1'b0,m_coin};//BTN_OSD
//wire [7:0] IN0_act = IN0[7:0];//BTN_OSD
assign cont_out = IN0_act;

//end of temp

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

//reg INV = 1'b1;//temp reg
wire INV;
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

wire WRpri_n = (WR_n | MREQ_n);
wire [3:0] B16_out;

wire RWRpri_n = B16_out[3];
wire D17_1_q;
wire A13star = (A[13] & D17_1_q);

  ls157 ic16B(
	.i0({1'b1,1'b0,1'b0,A16_out[2]}),
	.i1({WRpri_n,1'b0,MREQ_n,A[12]}),
	.e_n(1'b0),
	.s(A13star),
	.z(B16_out)
  );

wire [3:0] B15_out;

  ls157 ic15B(
	.i0({A16_out[1:0],scrn_count_out[9:8]}),
	.i1(A[11:8]),
	.e_n(1'b0),
	.s(A13star),
	.z(B15_out)
  );

wire [3:0] B14_out;

  ls157 ic14B(
	.i0(scrn_count_out[7:4]),
	.i1(A[7:4]),
	.e_n(1'b0),
	.s(A13star),
	.z(B14_out)
  );

wire [3:0] B13_out;

  ls157 ic13B(
	.i0(scrn_count_out[3:0]),
	.i1(A[3:0]),
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

wire ROM0_d,ROM1_d,ROM2_d,ROM3_d,ROM4_d,ROM5_d,P7_n,PORTEN_n;


  ls138 ic4D(
    .G_n2A(A[13]),  
    .G_n2B(MAQ_n),
    .G1(IORQ_n),
    .A({A[14],A[12:11]}),
    .Y({PORTEN_n,P7_n,ROM5_d,ROM4_d,ROM3_d,ROM2_d,ROM1_d,ROM0_d})
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

//needed for FPGA version
  //ls74 ic30A_1(
	//.//pre_n(PUR),
	//.//clr_n(PUR),
	//.//clk(FPGA_CLK1_50),
	//.//d(M5Hz_n),
	//.//q(),
  //  .q_n(pixclk)
  //);

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

wire sparkle;
reg [5:0] cnt = 6'b00000;

always @(posedge V256) begin
	cnt <= cnt + 1;
end
assign sparkle = cnt[5];

wire prog_rom6_cs = (dn_addr[14:11] == 4'b0110);
wire prog_rom7_cs = (dn_addr[14:11] == 4'b0111);

dpram #(11,8,"") ic11F_ROM6 //side a cpu, side b loading
(
	.clock_a(clk),
	.wren_a(1'b0),
	.address_a({INV,V128,V64,V32,V16,V8,H128,H64,H32,H16,H8}),
	.data_a(),
	.q_a(rom6_dout),
	.clock_b(clk),
	.wren_b(dn_wr & prog_rom6_cs),
	.address_b(dn_addr[10:0]),
	.data_b(dn_data),
	.q_b()
);

dpram #(11,8,"") ic12F_ROM7 //side a cpu, side b loading
(
	.clock_a(clk),
	.wren_a(1'b0),
	.address_a({sparkle,V128,V64,V32,V16,V8,H128,H64,H32,H16,H8}),//1'b0 is a test
	.data_a(),												//probably create a clock
	.q_a(rom7_dout),
	.clock_b(clk),
	.wren_b(dn_wr & prog_rom7_cs),
	.address_b(dn_addr[10:0]),
	.data_b(dn_data),
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
//wire RED,GREEN,BLUE;

  ls157 ic13G( //A & B may be reversed
	.i0({1'b0,F14_8,F14_6,F14_3}),//{1'b0,G12_8,G12_6,G12_3}
	.i1({1'b0,G12_8,G12_6,G12_3}),//{1'b0,F14_8,F14_6,F14_3}
	.e_n(1'b0),
	.s(VID1),
	.z({G13_outblnk,RED,GREEN,BLUE})
  );

//end of video
//interrupt

wire A9_11 = (V32 | V64);
wire G15_8 = (~V16 & STARENV);
wire INT_n = (A9_11 | ~G15_8);

wire INTA_n = (M1_n | IORQ_n);
wire [7:0] INTVEC = {3'b110,~V128,V128,3'b111};//{3'b111,V128,~V128,1'b0,2'b11}

//end of interrupt
//misc 1

wire [6:0] P;
wire [2:0] E17_out;

  ls42 ic17E(
    .in({PORTEN_n,A[2],A[1],A[0]}),
    .out({E17_out[2:0],P[6:0]})
  );

wire OUT3 = (WR_n | P[3]);
wire OUT5 = (WR_n | P[5]);

  ls74 ic17D_2(
	.pre_n(PUR),
	.clr_n(RESET_n),
	.clk(OUT5),
	.d(cpudata_out[5]),
	.q(),
    .q_n(INV)
  );


//end of misc 1
//Roms

wire prog_rom0_cs = (dn_addr[14:11] == 4'b0000);
wire prog_rom1_cs = (dn_addr[14:11] == 4'b0001);
wire prog_rom2_cs = (dn_addr[14:11] == 4'b0010);
wire prog_rom3_cs = (dn_addr[14:11] == 4'b0011);
wire prog_rom4_cs = (dn_addr[14:11] == 4'b0100);
wire prog_rom5_cs = (dn_addr[14:11] == 4'b0101);

wire [7:0] rom0_dout,rom1_dout,rom2_dout,rom3_dout,rom4_dout,rom5_dout;

dpram #(11,8,"") ic5D_ROM0 //side a cpu, side b loading     rom0.txt
(
	.clock_a(clk),
	.wren_a(1'b0),
	.address_a(A[10:0]),
	.data_a(),
	.q_a(rom0_dout),
	.clock_b(clk),
	.wren_b(dn_wr & prog_rom0_cs),
	.address_b(dn_addr[10:0]),
	.data_b(dn_data),
	.q_b()
);

dpram #(11,8,"") ic6D_ROM1 // rom1.txt
(
	.clock_a(clk),
	.wren_a(1'b0),
	.address_a(A[10:0]),
	.data_a(),
	.q_a(rom1_dout),
	.clock_b(clk),
	.wren_b(dn_wr & prog_rom1_cs),
	.address_b(dn_addr[10:0]),
	.data_b(dn_data),
	.q_b()
);

dpram #(11,8,"") ic8D_ROM2  //rom2.txt
(
	.clock_a(clk),
	.wren_a(1'b0),
	.address_a(A[10:0]),
	.data_a(),
	.q_a(rom2_dout),
	.clock_b(clk),
	.wren_b(dn_wr & prog_rom2_cs),
	.address_b(dn_addr[10:0]),
	.data_b(dn_data),
	.q_b()
);

dpram #(11,8,"") ic10D_ROM3
(
	.clock_a(clk),
	.wren_a(1'b0),
	.address_a(A[10:0]),
	.data_a(),
	.q_a(rom3_dout),
	.clock_b(clk),
	.wren_b(dn_wr & prog_rom3_cs),
	.address_b(dn_addr[10:0]),
	.data_b(dn_data),
	.q_b()
);

dpram #(11,8,"") ic11D_ROM4
(
	.clock_a(clk),
	.wren_a(1'b0),
	.address_a(A[10:0]),
	.data_a(),
	.q_a(rom4_dout),
	.clock_b(clk),
	.wren_b(dn_wr & prog_rom4_cs),
	.address_b(dn_addr[10:0]),
	.data_b(dn_data),
	.q_b()
);

dpram #(11,8,"") ic12D_ROM5
(
	.clock_a(clk),
	.wren_a(1'b0),
	.address_a(A[10:0]),
	.data_a(),
	.q_a(rom5_dout),
	.clock_b(clk),
	.wren_b(dn_wr & prog_rom5_cs),
	.address_b(dn_addr[10:0]),
	.data_b(dn_data),
	.q_b()
);
//end of roms
//addressing 2

wire ROM0_n = ~(A[15:11] == 5'b00000);
wire ROM1_n = ~(A[15:11] == 5'b00001);
wire ROM2_n = ~(A[15:11] == 5'b00010);
wire ROM3_n = ~(A[15:11] == 5'b00011);
wire ROM4_n = ~(A[15:11] == 5'b01000);
wire ROM5_n = ~(A[15:11] == 5'b01001);
wire RAM0_n = ~(A[15:10] == 6'b001000);
wire RAM1_n = ~(A[15:10] == 6'b001001);
wire RAM2_n = ~(A[15:10] == 6'b001010);
wire RAM3_n = ~(A[15:10] == 6'b001011);
wire RAM4_n = ~(A[15:10] == 6'b001100);
wire RAM5_n = ~(A[15:10] == 6'b001101);
wire RAM6_n = ~(A[15:10] == 6'b001110);
wire RAM7_n = ~(A[15:10] == 6'b001111);
//wire SND_N = A[15:0] == 16'h5803;

wire P5001 = A[15:0] == 16'h5001;
wire P5002 = A[15:0] == 16'h5002;
wire P5035 = A[15:0] == 16'h5035;
wire P5051 = A[15:0] == 16'h5051;
wire P5079 = A[15:0] == 16'h5079;

//end of addressing 2
//RAM

wire [7:0] ram0_dout,ram1_dout,ram2_dout,ram3_dout,ram4_dout,ram5_dout,ram6_dout,ram7_dout;
wire [7:0] vram0_dout,vram1_dout,vram2_dout,vram3_dout,vram4_dout,vram5_dout,vram6_dout,vram7_dout;

dpram #(11,8,"") ic4C_RAM0  //side a cpu, side b loading
(
	.clock_a(clk),
	.wren_a(~WR_n & ~RAM0_n),
	.address_a({1'b0,A[9:0]}),
	.data_a(cpudata_out),
	.q_a(ram0_dout),
	.clock_b(clk),
	.wren_b(1'b0),
	.address_b({1'b0,RA[9:0]}),
	.data_b(),
	.q_b(vram0_dout)
);

dpram #(11,8,"") ic5C_RAM1  //side a cpu, side b loading
(
	.clock_a(clk),
	.wren_a(~WR_n & ~RAM1_n),
	.address_a({1'b0,A[9:0]}),
	.data_a(cpudata_out),
	.q_a(ram1_dout),
	.clock_b(clk),
	.wren_b(1'b0),
	.address_b({1'b0,RA[9:0]}),
	.data_b(),
	.q_b(vram1_dout)
);

dpram #(11,8,"") ic6C_RAM2  //side a cpu, side b loading
(
	.clock_a(clk),
	.wren_a(~WR_n & ~RAM2_n),
	.address_a({1'b0,A[9:0]}),
	.data_a(cpudata_out),
	.q_a(ram2_dout),
	.clock_b(clk),
	.wren_b(1'b0),
	.address_b({1'b0,RA[9:0]}),
	.data_b(),
	.q_b(vram2_dout)
);

dpram #(11,8,"") ic7C_RAM3  //side a cpu, side b loading
(
	.clock_a(clk),
	.wren_a(~WR_n & ~RAM3_n),
	.address_a({1'b0,A[9:0]}),
	.data_a(cpudata_out),
	.q_a(ram3_dout),
	.clock_b(clk),
	.wren_b(1'b0),
	.address_b({1'b0,RA[9:0]}),
	.data_b(),
	.q_b(vram3_dout)
);

dpram #(11,8,"") ic8C_RAM4  //side a cpu, side b loading
(
	.clock_a(clk),
	.wren_a(~WR_n & ~RAM4_n),
	.address_a({1'b0,A[9:0]}),
	.data_a(cpudata_out),
	.q_a(ram4_dout),
	.clock_b(clk),
	.wren_b(1'b0),
	.address_b({1'b0,RA[9:0]}),
	.data_b(),
	.q_b(vram4_dout)
);

dpram #(11,8,"") ic9C_RAM5  //side a cpu, side b loading
(
	.clock_a(clk),
	.wren_a(~WR_n & ~RAM5_n),
	.address_a({1'b0,A[9:0]}),
	.data_a(cpudata_out),
	.q_a(ram5_dout),
	.clock_b(clk),
	.wren_b(1'b0),
	.address_b({1'b0,RA[9:0]}),
	.data_b(),
	.q_b(vram5_dout)
);

dpram #(11,8,"") ic10C_RAM6  //side a cpu, side b loading
(
	.clock_a(clk),
	.wren_a(~WR_n & ~RAM6_n),
	.address_a({1'b0,A[9:0]}),
	.data_a(cpudata_out),
	.q_a(ram6_dout),
	.clock_b(clk),
	.wren_b(1'b0),
	.address_b({1'b0,RA[9:0]}),
	.data_b(),
	.q_b(vram6_dout)
);

dpram #(11,8,"") ic10C_RAM7  //side a cpu, side b loading
(
	.clock_a(clk),
	.wren_a(~WR_n & ~RAM7_n),
	.address_a({1'b0,A[9:0]}),
	.data_a(cpudata_out),
	.q_a(ram7_dout),
	.clock_b(clk),
	.wren_b(1'b0),
	.address_b({1'b0,RA[9:0]}),
	.data_b(),
	.q_b(vram7_dout)
);

//end of RAM
//cpu

  cpu_z80 cpu1(
	.CLK(M5Hz_en),//H1
	.nRESET(RESET_n),
	.DATA_IN(cpudata_in),
	.DATA_OUT(cpudata_out),
	.ADDRESS(A),
	.nIORQ(IORQ_n),
	.nMREQ(MREQ_n),
	.nRD(RD_n),
	.nWR(WR_n),
	.m1_n(M1_n),
	.nINT(INT_n),
	.nNMI(NMI_n)
  );
  
//end of cpu
//IO 1
wire [3:0] G10_q;
wire [3:0] G10_q_n = ~G10_q;

  ls175 ic10G(
	.d({1'b0,cpudata_out[2:0]}),
	.clk(OUT3),
	.clr_n(RESET_n),
	.q(G10_q),
    .q_n()
  );
  
wire [7:0] G5_q;
  
  ls164 ic5G(
	.clr_n(RESET_n),
    .clk(G10_q_n[1]),
  	.in({G10_q_n[2],G10_q_n[2]}),
    .out(G5_q)	
  );

//end of IO 1
//temp

wire [15:0] A2;
wire [7:0] cpudata2_in,cpudata2_out;
wire MREQ2_n;
wire WR2_n;

//wire NMI2_n;

//end of temp

//start of cpuclk
wire ays_clken;

clock cpu_clk1(
    .clk(clk),
    .rst_n(nRESET),
	.Phi2(H2),
    .cpu_clken(ays_clken)
    );
	
//end of cpuclk
//sound addressing

wire [9:0] G1_out;

  ls42 ic1G(
    .in({MREQ2_n,A2[15:13]}),
    .out(G1_out)
  );

//end of sound addressing
//sound ROM
wire [7:0] sndodd_dout;
wire prog_romsnd_cs = (dn_addr[14:12] == 3'b100);

dpram #(12,8,"sound.txt") ic1_2F_ROM  //side a cpu, side b loading
(
	.clock_a(clk),
	.wren_a(1'b0),
	.address_a(A2[11:0]),
	.data_a(),
	.q_a(sndodd_dout),
	.clock_b(clk),
	.wren_b(dn_wr & prog_romsnd_cs),
	.address_b(dn_addr[11:0]),
	.data_b(dn_data),
	.q_b()
);

wire [7:0] snd_dout = {sndodd_dout[4],sndodd_dout[5],sndodd_dout[6],sndodd_dout[0],sndodd_dout[7],sndodd_dout[1],sndodd_dout[3],sndodd_dout[2]};
//end of sound ROM
//addressing

wire ROMS_n = G1_out[0];
wire RAMS_n = G1_out[4];
wire AYS_n = G1_out[5];

//end of addressing
//sound RAM
wire [7:0] rams_dout;

spram #(10,8,"") ic_2_3FG_RAM
(
	.clk(clk),
	.address(A2[9:0]),
	.wren(~WR2_n & ~RAMS_n),
	.data(cpudata2_out),
	.q(rams_dout)
);

//end of sound RAM
//sound chip
wire [7:0] ays_dout;
wire [7:0] IOA_out,IOB_in,IOB_out;
wire [9:0] sound_out;
wire BDIR = ~(AYS_n | A2[1]);
wire BC1 = ~(AYS_n | A2[0]);

wire [7:0] IOA_in = {G5_q[0],G5_q[1],G5_q[2],G5_q[3],G5_q[4],G5_q[5],G5_q[6],G5_q[7]};

jt49_bus ic5F( // note that input ports are not multiplexed
    .rst_n(RESET_n),
    .clk(~H2),    // signal on positive edge  ~H2
    .clk_en(1'b1), // synthesis direct_enable = 1 */,   ~ays_clken
    .bdir(BDIR),// bus control pins of original chip
    .bc1(BC1),
    .din(cpudata2_out),//7 wide
    .sel(1'b0), // if sel is low, the clock is divided by 2
    .dout(ays_dout),//7 wide
    .sound(sound_out),  //9 wide combined channel output
    .A(), //7 wide linearised channel output
    .B(),
    .C(),
    .sample(),
    .IOA_in(IOA_in),
    .IOA_out(IOA_out),
    .IOB_in(IOB_in),
    .IOB_out(IOB_out)
);

//end of sound chip
//cpu

  cpu_z80 cpu2(
	.CLK(~H1),//H1
	.nRESET(RESET_n),
	.DATA_IN(cpudata2_in),
	.DATA_OUT(cpudata2_out),
	.ADDRESS(A2),
	.nIORQ(),
	.nMREQ(MREQ2_n),
	.nRD(),
	.nWR(WR2_n),
	.m1_n(),
	.nINT(V8),//INT2_n
	.nNMI(G10_q_n[0]) //NMI2_n
  );

//protection spoof
reg tog_5002 = 1'b0;
always @(posedge H8) begin
	if ((A == 16'h5002) && (cpudata_in == 8'hAA)) 
		tog_5002 <= 1'b1;
	else
		tog_5002 <= 1'b0;
end
  
//end of cpu
//start of Address muxing

assign cpudata_in = (!ROM0_n && !RD_n) ? rom0_dout : //ROM0_d
					(!ROM1_n && !RD_n) ? rom1_dout :
					(!ROM2_n && !RD_n) ? rom2_dout :
					(!ROM3_n && !RD_n) ? rom3_dout :
					(!ROM4_n && !RD_n) ? rom4_dout :
					(!ROM5_n && !RD_n) ? rom5_dout :
					(!RAM0_n && !RD_n) ? ram0_dout :
					(!RAM1_n && !RD_n) ? ram1_dout :
					(!RAM2_n && !RD_n) ? ram2_dout :
					(!RAM3_n && !RD_n) ? ram3_dout :
					(!RAM4_n && !RD_n) ? ram4_dout :
					(!RAM5_n && !RD_n) ? ram5_dout :
					//(!P7_n && ~(|G5_q[7:0])) ? 8'h38 : //E0 //FF //38
					//(!P7_n && G5_q[0]) ? DIPSW :
					//(!P7_n && G5_q[1]) ? 8'h7D :
					//(!P7_n && G5_q[2]) ? 8'hF4 :
					(!P7_n && G5_q[0]) ? DIP : //DIPSW
					(P5001 && ~(|G5_q[7:0])) ? 8'h7D :				
					(P5001 && G5_q[1]) ? 8'h7D :
					(P5001 && G5_q[2]) ? 8'hF4 :
					//(P5002 && ~(|G5_q[7:0])) ? 8'hAA :		
					//(P5002 && (|G5_q[7:0])) ? 8'hF4 : 
					//(P5002 && G5_q[2]) ? 8'hF4 :
					(P5002 && ~tog_5002) ? 8'hAA :
					(P5002 && tog_5002) ? 8'hF4 :
					(P5035) ? 8'h38 :
					(P5051) ? 8'hAA :
					(P5079) ? 8'h38 :				
					(!P[1]) ? IN0_act : //~BTN_USER
					(!P[2]) ? IN1 :
					(!INTA_n) ? INTVEC :
					//SND_N ? 8'hFF :
					8'h00;

assign VRAM_dout =  (!RAM0_d && !A13star) ? vram0_dout :
					(!RAM1_d && !A13star) ? vram1_dout :
					(!RAM2_d && !A13star) ? vram2_dout :
					(!RAM3_d && !A13star) ? vram3_dout :
					(!RAM4_d && !A13star) ? vram4_dout :
					(!RAM5_d && !A13star) ? vram5_dout :
					(!RAM6_d && !A13star) ? vram6_dout :
					(!RAM7_d && !A13star) ? vram7_dout :
					8'h00;


//end of Address muxing
//start of Address muxing

assign cpudata2_in = (!ROMS_n) ? snd_dout : 
					(!RAMS_n) ? rams_dout :
					(!AYS_n) ? ays_dout :
					8'h00;
					
//end of address muxing
//start of video out

  assign VGA_R = {6{RED}};
  assign VGA_G = {6{GREEN}};
  assign VGA_B = {6{BLUE}};
  assign VGA_HS = COMPSYNC;
  
//end of video out
endmodule 