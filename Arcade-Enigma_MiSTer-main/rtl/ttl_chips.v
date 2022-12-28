//TTL index
// 08
// 10
// 42
// 74
// 107
// 138
// 139
// 157
// 161
// 163
// 166
// 174
// 175
// 251
// 259
// 273
// 283
// 365
// 366
// 367
// 374

//74LS08 Chip pinout:
/*     _____________
     _|             |_
a1  |_|1          14|_| VCC
     _|             |_                     
b1  |_|2          13|_| a4
     _|             |_
y1  |_|3          12|_| b4
     _|             |_
a2  |_|4          11|_| y4
     _|             |_
b2  |_|5          10|_| a3
     _|             |_
y2  |_|6           9|_| b3
     _|             |_
GND |_|7           8|_| y3
      |_____________|
*/

module ls08
(
	input  a1, a2, a3, a4,
	input  b1, b2, b3, b4,
	output y1, y2, y3, y4
);

assign y1 = a1 & b1;
assign y2 = a2 & b2;
assign y3 = a3 & b3;
assign y4 = a4 & b4;
	
endmodule

//74LS10 Chip pinout:
/*     _____________
     _|             |_
a1  |_|1          14|_| VCC
     _|             |_                     
b1  |_|2          13|_| c1
     _|             |_
a2  |_|3          12|_| y1
     _|             |_
b2  |_|4          11|_| a3
     _|             |_
c2  |_|5          10|_| b3
     _|             |_
y2  |_|6           9|_| c3
     _|             |_
GND |_|7           8|_| y3
      |_____________|
*/

module ls10
(
	input  a1, a2, a3,
	input  b1, b2, b3,
    input  c1, c2, c3,
	output y1, y2, y3
);

  assign y1 = ~(a1 & b1 & c1);
  assign y2 = ~(a2 & b2 & c2);
  assign y3 = ~(a3 & b3 & c3);
	
endmodule

//74LS42 Chip pinout:
/*     _____________
     _|             |_
0   |_|1          16|_| VCC
     _|             |_                     
1   |_|2          15|_| A  input
     _|             |_
2   |_|3          14|_| B  input
     _|             |_
3   |_|4          13|_| C  input
     _|             |_
4   |_|5          12|_| D  input
     _|             |_
5   |_|6          11|_| 9
     _|             |_
6   |_|7          10|_| 8
     _|             |_	 
GND |_|8           9|_| 7
      |_____________|
*/

module ls42
(
    input  [3:0] in,
  output reg [9:0] out
);
  // in = [DCBA]
  // out = [9876543210]
  
  always @ (*)
    case (in)
    	4'b0000: out = 10'b1111111110;
        4'b0001: out = 10'b1111111101;
        4'b0010: out = 10'b1111111011;
        4'b0011: out = 10'b1111110111;
        4'b0100: out = 10'b1111101111;
		4'b0101: out = 10'b1111011111;
        4'b0110: out = 10'b1110111111;
        4'b0111: out = 10'b1101111111;
        4'b1000: out = 10'b1011111111;
        4'b1001: out = 10'b0111111111;
        4'b1010: out = 10'b1111111111;
        4'b1011: out = 10'b1111111111;
        4'b1100: out = 10'b1111111111;
        4'b1101: out = 10'b1111111111;
        4'b1110: out = 10'b1111111111;
        4'b1111: out = 10'b1111111111;      
        default: out = 10'b1111111111;
    endcase
		
endmodule

//74LS74 Chip pinout:
/*        _____________
        _|             |_
n_clr1 |_|1          14|_| VCC
        _|             |_                     
d1     |_|2          13|_| n_clr2
        _|             |_
clk1   |_|3          12|_| d2
        _|             |_
n_pre1 |_|4          11|_| clk2
        _|             |_
q1     |_|5          10|_| n_pre2
        _|             |_
n_q1   |_|6           9|_| q2
        _|             |_
GND    |_|7           8|_| n_q2
         |_____________|
*/

module ls74
(
	input  pre_n,
	input  clr_n,
	input  clk,
	input  d,
	output reg q,
    output q_n
);

always @(posedge clk or negedge pre_n or negedge clr_n) begin
	if(!pre_n)
		q <= 1;
	else if(!clr_n)
		q <= 0;
	else
		q <= d;
end
assign q_n = ~q;

endmodule

module ls74_2
(
	input  pre_n,
	input  clr_n,
	input  clk,
	input  clk_en,
	input  d,
	output reg q,
    output q_n
);

always @(posedge clk or negedge pre_n or negedge clr_n) begin
	if(!pre_n)
		q <= 1;
	else if(!clr_n)
		q <= 0;
	else if(clk_en)
		q <= d;
end
assign q_n = ~q;

endmodule

//74LS107 Chip pinout:
/*     _____________
     _|             |_
1J  |_|1          14|_| VCC
     _|             |_                     
1nQ |_|2          13|_| 1nCLR
     _|             |_
1Q  |_|3          12|_| 1CK
     _|             |_
1K  |_|4          11|_| 2K
     _|             |_
2Q  |_|5          10|_| 2nCLR
     _|             |_
2nQ |_|6           9|_| 2CK
     _|             |_
GND |_|7           8|_| 2J
      |_____________|
*/

module ls107(
   input clr_n, 
   input clk, 
   input j, 
   input k, 
   output reg q, 
   output q_n
);

assign q_n=~q;
  always @(negedge clk or negedge clr_n) begin
	if (!clr_n) q<=1'b0; else
		case ({j, k})
		2'b00: q<=q;
		2'b01: q<=1'b0;
		2'b10: q<=1'b1;
		2'b11: q<=~q;
		endcase
  end
endmodule

//74LS138 Chip pinout
/*      _____________
      _|             |_
A    |_|1          16|_| VCC
      _|             |_                     
B    |_|2          15|_| Y0
      _|             |_
C    |_|3          14|_| Y1
      _|             |_
G_n2A|_|4          13|_| Y2
      _|             |_
G_n2B|_|5          12|_| Y3
      _|             |_
G1   |_|6          11|_| Y4
      _|             |_
Y7   |_|7          10|_| Y5
      _|             |_
GND  |_|8           9|_| Y6
       |_____________|
*/

module ls138 
(
  input G_n2A,
  input G_n2B,
  input G1,
  input [2:0] A,
  output reg [7:0] Y
);

  always @ (G_n2A,G_n2B,G1,A)
        begin
          if (!G_n2A && !G_n2B && G1) begin
            case (A)
              3'b000: Y[7:0]=8'b11111110;
              3'b001: Y[7:0]=8'b11111101;   
              3'b010: Y[7:0]=8'b11111011;
              3'b011: Y[7:0]=8'b11110111;    
              3'b100: Y[7:0]=8'b11101111;
              3'b101: Y[7:0]=8'b11011111;
              3'b110: Y[7:0]=8'b10111111;
              3'b111: Y[7:0]=8'b01111111;           
              default: Y[7:0]=8'bZZZZZZZZ;
        	endcase
          end else begin
            Y[7:0]=8'b11111111;
          end
		end
endmodule

//74LS139 Chip pinout:
/*      _____________
      _|             |_
1n_G |_|1          16|_| VCC
      _|             |_                     
1A   |_|2          15|_| 2n_G
      _|             |_
1B   |_|3          14|_| 2A
      _|             |_
1Y0  |_|4          13|_| 2B
      _|             |_
1Y1  |_|5          12|_| 2Y0
      _|             |_
1Y2  |_|6          11|_| 2Y1
      _|             |_
1Y3  |_|7          10|_| 2Y2
      _|             |_
GND  |_|8           9|_| 2Y3
       |_____________|
*/

module ls139
(
	input  		 a,
    input  		 b,
  	input  		 g_n,
  	output [3:0] y
);

  assign y = (!g_n && !a && !b) ? 4'b1110:
    (!g_n && a && !b)  ? 4'b1101:
    (!g_n && !a && b)  ? 4'b1011:
    (!g_n && a && b)   ? 4'b0111:
	4'b1111;
		
endmodule

//74LS157 Chip pinout:
/*       _____________
       _|             |_
s     |_|1          16|_| VCC
       _|             |_                     
i0(0) |_|2          15|_| e_n
       _|             |_
i1(0) |_|3          14|_| i0(2)
       _|             |_
z(0)  |_|4          13|_| i1(2)
       _|             |_
i0(1) |_|5          12|_| z(2)
       _|             |_
i1(1) |_|6          11|_| i0(3)
       _|             |_
z(1)  |_|7          10|_| i1(3)
       _|             |_
GND   |_|8           9|_| z(3)
        |_____________|
*/

module ls157 
(
	input  [3:0] i0,
	input  [3:0] i1,
	input        e_n,
	input        s,
	output [3:0] z
);

assign z = (!e_n && !s) ? i0:
	(!e_n && s)     ? i1:
	4'b0000;	
	
endmodule

//74LS161 Chip pinout:
/*        _____________
        _|             |_
clr_n  |_|1          16|_| VCC
        _|             |_                     
clk    |_|2          15|_| rco
        _|             |_
din(0) |_|3          14|_| q(0)
        _|             |_
din(1) |_|4          13|_| q(1)
        _|             |_
din(2) |_|5          12|_| q(2)
        _|             |_
din(3) |_|6          11|_| q(3)
        _|             |_
enp    |_|7          10|_| ent
        _|             |_
GND    |_|8           9|_| load_n
         |_____________|
*/

module ls161 //asynchronous reset/clear
(
	input        clr_n,
	input        clk,
	input  [3:0] din,
	input        enp, ent,
	input        load_n,
	output [3:0] q,
	output       rco
);

  reg [3:0] data = 4'b0;

always @(posedge clk or negedge clr_n) begin
	if(!clr_n)
		data <= 4'd0;
	else
		if(!load_n)
			data <= din;
		else if(enp && ent)
			data <= data + 4'd1;
end

assign q = data;
assign rco = data[0] & data[1] & data[2] & data[3] & ent;

endmodule

module ls161_2 //asynchronous reset/clear
(
	input        clr_n,
	input        clk,
	input        clk_en,	
	input  [3:0] din,
	input        enp, ent,
	input        load_n,
	output [3:0] q,
	output       rco
);

  reg [3:0] data = 4'b0;

always @(posedge clk or negedge clr_n) begin
	if(!clr_n)
		data <= 4'd0;
	else if (clk_en)
		if(!load_n)
			data <= din;
		else if(enp && ent)
			data <= data + 4'd1;
end

assign q = data;
assign rco = data[0] & data[1] & data[2] & data[3] & ent;

endmodule

//74LS163 Chip pinout:
/*        _____________
        _|             |_
n_clr  |_|1          16|_| VCC
        _|             |_                     
clk    |_|2          15|_| rco
        _|             |_
din(0) |_|3          14|_| q(0)
        _|             |_
din(1) |_|4          13|_| q(1)
        _|             |_
din(2) |_|5          12|_| q(2)
        _|             |_
din(3) |_|6          11|_| q(3)
        _|             |_
enp    |_|7          10|_| ent
        _|             |_
GND    |_|8           9|_| n_load
         |_____________|
*/

module ls163 //synchronous reset/clear
(
	input        n_clr,
	input        clk,
	input  [3:0] din,
	input        enp, ent,
	input        n_load,
	output [3:0] q,
	output       rco
);

  reg [3:0] data = 4'b0;

always @(posedge clk) begin
	if(!n_clr)
		data <= 4'd0;
	else
		if(!n_load)
			data <= din;
		else if(enp && ent)
			data <= data + 4'd1;
end

assign q = data;
assign rco = data[0] & data[1] & data[2] & data[3] & ent;

endmodule

//74LS164 Chip pinout:
/*            _____________
            _|             |_
serial in A|_|1          14|_| VCC
            _|             |_                     
serial in B|_|2          13|_| parra out H
            _|             |_
parra out A|_|3          12|_| parra out G
            _|             |_
parra out B|_|4          11|_| parra out F
            _|             |_
parra out C|_|5          10|_| parra out E
            _|             |_
parra out D|_|6           9|_| clr_n
            _|             |_
GND        |_|7           8|_| clk
             |_____________|
*/

module ls164
(
	input clr_n,
    input clk,
  	input [1:0] in,
    output reg [7:0] out	
);

reg [7:0]tmp = 8'b00000000;
wire in_and = (in[0] & in[1]);
  
always @(posedge clk or negedge clr_n)
if (!clr_n)
	out = 8'b00000001;//forced state
else
begin
  tmp = out<<1;
  out = {tmp[7:1],in_and};
end

endmodule

//74LS165 Chip pinout: NOT FULLY FUNCTIONAL (SAME AS 166 without CLEAR)
/*            _____________
            _|             |_
serial inp |_|1          16|_| VCC
            _|             |_                     
CLK        |_|2          15|_| CLK inhibit
            _|             |_
parra in E |_|3          14|_| parra in D
            _|             |_
parra in F |_|4          13|_| parra in C
            _|             |_
parra in G |_|5          12|_| parra in B
            _|             |_
parra in H |_|6          11|_| parra in A
            _|             |_
ser out_n  |_|7          10|_| serial input
            _|             |_
GND        |_|8           9|_| serial out
             |_____________|
*/

module ls165
(
    input clk,
    input load,
  	input [7:0] in,
    output out	
);
  
reg [7:0]tmp;

always @(posedge clk)
begin
	if (!load)
		tmp <= in;
	else
		tmp <= {tmp[6:0], 1'b0};
end
assign out = tmp[7];

endmodule

module ls165_2
(
    input clk,
    input clk_en,
    input load,
  	input [7:0] in,
    output out	
);
  
reg [7:0]tmp;

always @(posedge clk) begin
	if (clk_en)
		if (!load)
			tmp <= in;
		else
			tmp <= {tmp[6:0], 1'b0};
end
assign out = tmp[7];

endmodule

//74LS166 Chip pinout: NOT FULLY FUNCTIONAL
/*            _____________
            _|             |_
serial inp |_|1          16|_| VCC
            _|             |_                     
parra in A |_|2          15|_| shift/load
            _|             |_
parra in B |_|3          14|_| parra in H
            _|             |_
parra in C |_|4          13|_| serial output
            _|             |_
parra in D |_|5          12|_| parra in G
            _|             |_
CLK inhibit|_|6          11|_| parra in F
            _|             |_
CLK        |_|7          10|_| parra in E
            _|             |_
GND        |_|8           9|_| clear
             |_____________|
*/

module ls166
(
    input clk,
    input load,
  	input [7:0] in,
    output out	
);
  
reg [7:0]tmp;

always @(posedge clk)
begin
	if (!load)
		tmp <= in;
	else
		tmp <= {tmp[6:0], 1'b0};
end
assign out = tmp[7];

endmodule

//74LS174 Chip pinout:
/*      _____________
      _|             |_
mr   |_|1          16|_| VCC
      _|             |_                     
q(0) |_|2          15|_| q(5)
      _|             |_
d(0) |_|3          14|_| d(5)
      _|             |_
d(1) |_|4          13|_| d(4)
      _|             |_
q(1) |_|5          12|_| q(4)
      _|             |_
d(2) |_|6          11|_| d(3)
      _|             |_
q(2) |_|7          10|_| q(3)
      _|             |_
GND  |_|8           9|_| clk
       |_____________|
*/

module ls174 
(
	input  [5:0] d,
	input        clk,
	input        mr,
	output reg [5:0] q
);

always @(posedge clk or negedge mr) begin
	if(!mr)
		q <= 6'b000000;
	else
		q <= d;
end

endmodule

//74LS175 Chip pinout:
/*      _____________
      _|             |_
clr_n|_|1          16|_| VCC
      _|             |_                     
q1   |_|2          15|_| q4
      _|             |_
q1_n |_|3          14|_| q4_n
      _|             |_
d1   |_|4          13|_| d4
      _|             |_
d2   |_|5          12|_| d3
      _|             |_
q2_n |_|6          11|_| q3_n
      _|             |_
q2   |_|7          10|_| q3
      _|             |_
GND  |_|8           9|_| clk
       |_____________|
*/

module ls175 
(
	input  [3:0] d,
	input        clk,
	input        clr_n,
	output reg [3:0] q,
    output [3:0] q_n
);

always @(posedge clk or negedge clr_n) begin
	if(!clr_n)
		q <= 4'b0000;
	else
		q <= d;
end
assign q_n = ~q;

endmodule

//74LS251 Chip pinout:
/*       _____________  
       _|             |_
 D(3) |_|1          16|_| VCC
       _|             |_
 D(2) |_|2          15|_| D(4)
       _|             |_
 D(1) |_|3          14|_| D(5)
       _|             |_
 D(0) |_|4          13|_| D(6)
       _|             |_
   Y  |_|5          12|_| D(7)
       _|             |_
   W  |_|6          11|_| A
       _|             |_
   S  |_|7          10|_| B
       _|             |_
  GND |_|8           9|_| C
        |_____________|
*/

module ls251
(
  	input  [2:0] CBA,
  	input		 s,
  	input  [7:0] D,
	output reg 	 Y,W
);

  always @ (CBA,s)
        begin
          if (!s) begin
          	case (CBA)
            	3'b000: Y=D[0];
            	3'b001: Y=D[1];    
            	3'b010: Y=D[2];    
            	3'b011: Y=D[3];    
            	3'b100: Y=D[4];
            	3'b101: Y=D[5];
            	3'b110: Y=D[6];
            	3'b111: Y=D[7];            
          		default: Y=1'bZ;
        	endcase
            W <=!Y;
          end
  		  else begin
        		Y <= 1'bZ;
            	W <= 1'bZ;
    	  end
	end
endmodule

//74LS259 Chip pinout: //check if enable is active low
/*       _____________  
       _|             |_
 A    |_|1          16|_| VCC
       _|             |_
 B    |_|2          15|_| Cl
       _|             |_
 C    |_|3          14|_| En
       _|             |_
 Q0   |_|4          13|_| Din
       _|             |_
 Q1   |_|5          12|_| Q7
       _|             |_
 Q2   |_|6          11|_| Q6
       _|             |_
 Q3   |_|7          10|_| Q5
       _|             |_
  GND |_|8           9|_| Q4
        |_____________|
*/

module ls259
(
  	input  [2:0] A,
  	input		 E_n,
    input		 C_n,
  	input  		 D,
  	output reg [7:0] Q
);

    always @ (E_n,C_n,D)
        begin
          if (!C_n && E_n) begin
            Q[7:0] <= 8'b00000000;
          end
          else if (!C_n && !E_n && !D) begin
            Q[7:0] <= 8'b00000000;
          end
          else if (!C_n && !E_n && D) begin
            case (A)
              3'b000: Q[7:0]=8'b00000001;
              3'b001: Q[7:0]=8'b00000010;   
              3'b010: Q[7:0]=8'b00000100;
              3'b011: Q[7:0]=8'b00001000;    
              3'b100: Q[7:0]=8'b00010000;
              3'b101: Q[7:0]=8'b00100000;
              3'b110: Q[7:0]=8'b01000000;
              3'b111: Q[7:0]=8'b10000000;           
              default: Q[7:0]=8'bZZZZZZZZ;
        	endcase
          end
          else if (C_n && E_n) begin
          //no change
          end
          else if (C_n && !E_n) begin
            case (A)
              3'b000: Q[0]=D;
              3'b001: Q[1]=D;    
              3'b010: Q[2]=D;    
              3'b011: Q[3]=D;    
              3'b100: Q[4]=D;
              3'b101: Q[5]=D;
              3'b110: Q[6]=D;
              3'b111: Q[7]=D;            
              default: Q[7:0]=8'bZZZZZZZZ;
        	endcase          
          end
		end
endmodule

//74LS273 Chip pinout:
/*      _____________
      _|             |_
res  |_|1          20|_| VCC
      _|             |_                     
q(0) |_|2          19|_| q(7)
      _|             |_
d(0) |_|3          18|_| d(7)
      _|             |_
d(1) |_|4          17|_| d(6)
      _|             |_
q(1) |_|5          16|_| q(6)
      _|             |_
q(2) |_|6          15|_| q(5)
      _|             |_
d(2) |_|7          14|_| d(5)
      _|             |_
d(3) |_|8          13|_| d(4)
      _|             |_
q(3) |_|9          12|_| q(4)
      _|             |_
GND  |_|10         11|_| clk
       |_____________|
*/

module ls273
(
	input  [7:0] d,
	input        clk,
	input        res,
	output reg [7:0] q
);

always @(posedge clk or negedge res) begin
	if(!res)
		q <= 8'h00;
	else
		q <= d;
end

endmodule

//74LS283 Chip pinout:
/*        _____________
        _|             |_
sum(1) |_|1          16|_| VCC
        _|             |_                     
b(1)   |_|2          15|_| b(2)
        _|             |_
a(1)   |_|3          14|_| a(2)
        _|             |_
sum(0) |_|4          13|_| sum(2)
        _|             |_
a(0)   |_|5          12|_| a(3)
        _|             |_
b(0)   |_|6          11|_| b(3)
        _|             |_
c_in   |_|7          10|_| sum(3)
        _|             |_
GND    |_|8           9|_| c_out
         |_____________|
*/

module ls283
(
	input  [3:0] a,
	input  [3:0] b,
	input        c_in,
	output [3:0] sum,
	output       c_out
);

wire [4:0] sum_int;

assign sum_int = {1'b0, a} + {1'b0, b} + {4'b0000, c_in};
assign sum = sum_int[3:0];
assign c_out = sum_int[4];

endmodule

//74LS365 Chip pinout:
/*        _____________
        _|             |_
oe1_n  |_|1          16|_| VCC
        _|             |_                     
1A     |_|2          15|_| oe2_n
        _|             |_
1Y     |_|3          14|_| 6A
        _|             |_
2A     |_|4          13|_| 6Y
        _|             |_
2Y     |_|5          12|_| 5A
        _|             |_
3A     |_|6          11|_| 5Y
        _|             |_
3Y     |_|7          10|_| 4A
        _|             |_
GND    |_|8           9|_| 4Y
         |_____________|
*/

module ls365
(
	input  oe1_n, oe2_n,
	input  [5:0] a,
	output reg [5:0] y
);

always @(*) begin
	if(!oe1_n && !oe2_n)
		y <= a;
	else
		y <= 6'bZZZZZZ;
end

endmodule

//74LS366 Chip pinout:
/*        _____________
        _|             |_
oe1_n  |_|1          16|_| VCC
        _|             |_                     
1A     |_|2          15|_| oe2_n
        _|             |_
1Y     |_|3          14|_| 6A
        _|             |_
2A     |_|4          13|_| 6Y
        _|             |_
2Y     |_|5          12|_| 5A
        _|             |_
3A     |_|6          11|_| 5Y
        _|             |_
3Y     |_|7          10|_| 4A
        _|             |_
GND    |_|8           9|_| 4Y
         |_____________|
*/

module ls366
(
	input  oe1_n, oe2_n,
	input  [5:0] a,
	output reg [5:0] y
);

always @(*) begin
	if(!oe1_n && !oe2_n)
		y <= ~a;
	else
		y <= 6'bZZZZZZ;
end

endmodule

//74LS367 Chip pinout:
/*        _____________
        _|             |_
oe1_n  |_|1          16|_| VCC
        _|             |_                     
1A     |_|2          15|_| oe2_n
        _|             |_
1Y     |_|3          14|_| 6A
        _|             |_
2A     |_|4          13|_| 6Y
        _|             |_
2Y     |_|5          12|_| 5A
        _|             |_
3A     |_|6          11|_| 5Y
        _|             |_
3Y     |_|7          10|_| 4A
        _|             |_
GND    |_|8           9|_| 4Y
         |_____________|
*/

module ls367
(
	input  oe1_n, oe2_n,
	input  [5:0] a,
	output reg [5:0] y
);

always @(*) begin
	if(!oe1_n)
		y[3:0] <= a[3:0];
	else
		y [3:0]<= 4'bZZZZ;
	if(!oe2_n)
		y[5:4] <= a[5:4];
	else
		y [5:4]<= 2'bZZ;
end

endmodule

//74LS374 Chip pinout:
/*        _____________
        _|             |_
oe_n   |_|1          20|_| VCC
        _|             |_                     
1Q     |_|2          19|_| 8Q
        _|             |_
1D     |_|3          18|_| 8D
        _|             |_
2D     |_|4          17|_| 7D
        _|             |_
2Q     |_|5          16|_| 7Q
        _|             |_
3Q     |_|6          15|_| 6Q
        _|             |_
3D     |_|7          14|_| 6D
        _|             |_
4D     |_|8          13|_| 5D
        _|             |_
4Q     |_|9          12|_| 5Q
        _|             |_
GND    |_|10         11|_| clk
         |_____________|
*/

module ls374
(
	input  oe_n,
	input  clk,
	input  [7:0] d,
	output reg [7:0] q
);

always @(posedge clk or posedge oe_n) begin
	if(oe_n)
		q <= 8'bZZZZZZZZ;
	else
		q <= d;
end

endmodule
