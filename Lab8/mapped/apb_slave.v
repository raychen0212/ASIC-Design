/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Mar 17 10:44:48 2021
/////////////////////////////////////////////////////////////


module apb_slave ( clk, n_rst, data_ready, overrun_error, framing_error, psel, 
        penable, pwrite, paddr, rx_data, pwdata, data_read, pslverr, data_size, 
        prdata, bit_period );
  input [2:0] paddr;
  input [7:0] rx_data;
  input [7:0] pwdata;
  output [3:0] data_size;
  output [7:0] prdata;
  output [13:0] bit_period;
  input clk, n_rst, data_ready, overrun_error, framing_error, psel, penable,
         pwrite;
  output data_read, pslverr;
  wire   \reg_map[6][7] , \reg_map[6][6] , \reg_map[6][5] , \reg_map[6][4] ,
         \reg_map[6][3] , \reg_map[6][2] , \reg_map[6][1] , \reg_map[6][0] ,
         \reg_map[4][7] , \reg_map[4][6] , \reg_map[4][5] , \reg_map[4][4] ,
         \reg_map[3][7] , \reg_map[3][6] , \reg_map[1][1] , \reg_map[1][0] ,
         \reg_map[0][0] , \nxt_reg_map[4][7] , \nxt_reg_map[4][6] ,
         \nxt_reg_map[4][5] , \nxt_reg_map[4][4] , \nxt_reg_map[4][3] ,
         \nxt_reg_map[4][2] , \nxt_reg_map[4][1] , \nxt_reg_map[4][0] ,
         \nxt_reg_map[3][7] , \nxt_reg_map[3][6] , \nxt_reg_map[3][5] ,
         \nxt_reg_map[3][4] , \nxt_reg_map[3][3] , \nxt_reg_map[3][2] ,
         \nxt_reg_map[3][1] , \nxt_reg_map[3][0] , \nxt_reg_map[2][7] ,
         \nxt_reg_map[2][6] , \nxt_reg_map[2][5] , \nxt_reg_map[2][4] ,
         \nxt_reg_map[2][3] , \nxt_reg_map[2][2] , \nxt_reg_map[2][1] ,
         \nxt_reg_map[2][0] , \nxt_reg_map[0][0] , N90, N91, N92, N93, N94,
         N95, N96, N97, N99, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204;
  assign \nxt_reg_map[0][0]  = data_ready;

  DFFSR \reg_map_reg[6][7]  ( .D(rx_data[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\reg_map[6][7] ) );
  DFFSR \reg_map_reg[6][6]  ( .D(rx_data[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\reg_map[6][6] ) );
  DFFSR \reg_map_reg[6][5]  ( .D(rx_data[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\reg_map[6][5] ) );
  DFFSR \reg_map_reg[6][4]  ( .D(rx_data[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\reg_map[6][4] ) );
  DFFSR \reg_map_reg[6][3]  ( .D(rx_data[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\reg_map[6][3] ) );
  DFFSR \reg_map_reg[6][2]  ( .D(rx_data[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\reg_map[6][2] ) );
  DFFSR \reg_map_reg[6][1]  ( .D(rx_data[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\reg_map[6][1] ) );
  DFFSR \reg_map_reg[6][0]  ( .D(rx_data[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\reg_map[6][0] ) );
  DFFSR \reg_map_reg[4][7]  ( .D(\nxt_reg_map[4][7] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\reg_map[4][7] ) );
  DFFSR \reg_map_reg[4][6]  ( .D(\nxt_reg_map[4][6] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\reg_map[4][6] ) );
  DFFSR \reg_map_reg[4][5]  ( .D(\nxt_reg_map[4][5] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\reg_map[4][5] ) );
  DFFSR \reg_map_reg[4][4]  ( .D(\nxt_reg_map[4][4] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\reg_map[4][4] ) );
  DFFSR \reg_map_reg[4][3]  ( .D(\nxt_reg_map[4][3] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(data_size[3]) );
  DFFSR \reg_map_reg[4][2]  ( .D(\nxt_reg_map[4][2] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(data_size[2]) );
  DFFSR \reg_map_reg[4][1]  ( .D(\nxt_reg_map[4][1] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(data_size[1]) );
  DFFSR \reg_map_reg[4][0]  ( .D(\nxt_reg_map[4][0] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(data_size[0]) );
  DFFSR \reg_map_reg[3][7]  ( .D(\nxt_reg_map[3][7] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\reg_map[3][7] ) );
  DFFSR \reg_map_reg[3][6]  ( .D(\nxt_reg_map[3][6] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\reg_map[3][6] ) );
  DFFSR \reg_map_reg[3][5]  ( .D(\nxt_reg_map[3][5] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[13]) );
  DFFSR \reg_map_reg[3][4]  ( .D(\nxt_reg_map[3][4] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[12]) );
  DFFSR \reg_map_reg[3][3]  ( .D(\nxt_reg_map[3][3] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[11]) );
  DFFSR \reg_map_reg[3][2]  ( .D(\nxt_reg_map[3][2] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[10]) );
  DFFSR \reg_map_reg[3][1]  ( .D(\nxt_reg_map[3][1] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[9]) );
  DFFSR \reg_map_reg[3][0]  ( .D(\nxt_reg_map[3][0] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[8]) );
  DFFSR \reg_map_reg[2][7]  ( .D(\nxt_reg_map[2][7] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[7]) );
  DFFSR \reg_map_reg[2][6]  ( .D(\nxt_reg_map[2][6] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[6]) );
  DFFSR \reg_map_reg[2][5]  ( .D(\nxt_reg_map[2][5] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[5]) );
  DFFSR \reg_map_reg[2][4]  ( .D(\nxt_reg_map[2][4] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[4]) );
  DFFSR \reg_map_reg[2][3]  ( .D(\nxt_reg_map[2][3] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[3]) );
  DFFSR \reg_map_reg[2][2]  ( .D(\nxt_reg_map[2][2] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[2]) );
  DFFSR \reg_map_reg[2][1]  ( .D(\nxt_reg_map[2][1] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[1]) );
  DFFSR \reg_map_reg[2][0]  ( .D(\nxt_reg_map[2][0] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[0]) );
  DFFSR \reg_map_reg[1][1]  ( .D(overrun_error), .CLK(clk), .R(n_rst), .S(1'b1), .Q(\reg_map[1][1] ) );
  DFFSR \reg_map_reg[1][0]  ( .D(framing_error), .CLK(clk), .R(n_rst), .S(1'b1), .Q(\reg_map[1][0] ) );
  DFFSR \reg_map_reg[0][0]  ( .D(\nxt_reg_map[0][0] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\reg_map[0][0] ) );
  LATCH \prdata_reg[7]  ( .CLK(N99), .D(N90), .Q(prdata[7]) );
  LATCH \prdata_reg[6]  ( .CLK(N99), .D(N91), .Q(prdata[6]) );
  LATCH \prdata_reg[5]  ( .CLK(N99), .D(N92), .Q(prdata[5]) );
  LATCH \prdata_reg[4]  ( .CLK(N99), .D(N93), .Q(prdata[4]) );
  LATCH \prdata_reg[3]  ( .CLK(N99), .D(N94), .Q(prdata[3]) );
  LATCH \prdata_reg[2]  ( .CLK(N99), .D(N95), .Q(prdata[2]) );
  LATCH \prdata_reg[1]  ( .CLK(N99), .D(N96), .Q(prdata[1]) );
  LATCH \prdata_reg[0]  ( .CLK(N99), .D(N97), .Q(prdata[0]) );
  NOR2X1 U188 ( .A(n136), .B(n137), .Y(pslverr) );
  OAI21X1 U189 ( .A(pwrite), .B(n138), .C(n139), .Y(n136) );
  NOR2X1 U190 ( .A(n140), .B(n141), .Y(n139) );
  INVX1 U191 ( .A(n142), .Y(\nxt_reg_map[4][7] ) );
  MUX2X1 U192 ( .B(\reg_map[4][7] ), .A(pwdata[7]), .S(n143), .Y(n142) );
  INVX1 U193 ( .A(n144), .Y(\nxt_reg_map[4][6] ) );
  MUX2X1 U194 ( .B(\reg_map[4][6] ), .A(pwdata[6]), .S(n143), .Y(n144) );
  INVX1 U195 ( .A(n145), .Y(\nxt_reg_map[4][5] ) );
  MUX2X1 U196 ( .B(\reg_map[4][5] ), .A(pwdata[5]), .S(n143), .Y(n145) );
  INVX1 U197 ( .A(n146), .Y(\nxt_reg_map[4][4] ) );
  MUX2X1 U198 ( .B(\reg_map[4][4] ), .A(pwdata[4]), .S(n143), .Y(n146) );
  INVX1 U199 ( .A(n147), .Y(\nxt_reg_map[4][3] ) );
  MUX2X1 U200 ( .B(data_size[3]), .A(pwdata[3]), .S(n143), .Y(n147) );
  INVX1 U201 ( .A(n148), .Y(\nxt_reg_map[4][2] ) );
  MUX2X1 U202 ( .B(data_size[2]), .A(pwdata[2]), .S(n143), .Y(n148) );
  MUX2X1 U203 ( .B(n149), .A(n150), .S(n143), .Y(\nxt_reg_map[4][1] ) );
  INVX1 U204 ( .A(data_size[1]), .Y(n149) );
  MUX2X1 U205 ( .B(n151), .A(n152), .S(n143), .Y(\nxt_reg_map[4][0] ) );
  NOR2X1 U206 ( .A(n153), .B(n154), .Y(n143) );
  INVX1 U207 ( .A(data_size[0]), .Y(n151) );
  INVX1 U208 ( .A(n155), .Y(\nxt_reg_map[3][7] ) );
  MUX2X1 U209 ( .B(\reg_map[3][7] ), .A(pwdata[7]), .S(n156), .Y(n155) );
  INVX1 U210 ( .A(n157), .Y(\nxt_reg_map[3][6] ) );
  MUX2X1 U211 ( .B(\reg_map[3][6] ), .A(pwdata[6]), .S(n156), .Y(n157) );
  INVX1 U212 ( .A(n158), .Y(\nxt_reg_map[3][5] ) );
  MUX2X1 U213 ( .B(bit_period[13]), .A(pwdata[5]), .S(n156), .Y(n158) );
  INVX1 U214 ( .A(n159), .Y(\nxt_reg_map[3][4] ) );
  MUX2X1 U215 ( .B(bit_period[12]), .A(pwdata[4]), .S(n156), .Y(n159) );
  INVX1 U216 ( .A(n160), .Y(\nxt_reg_map[3][3] ) );
  MUX2X1 U217 ( .B(bit_period[11]), .A(pwdata[3]), .S(n156), .Y(n160) );
  INVX1 U218 ( .A(n161), .Y(\nxt_reg_map[3][2] ) );
  MUX2X1 U219 ( .B(bit_period[10]), .A(pwdata[2]), .S(n156), .Y(n161) );
  MUX2X1 U220 ( .B(n162), .A(n150), .S(n156), .Y(\nxt_reg_map[3][1] ) );
  MUX2X1 U221 ( .B(n163), .A(n152), .S(n156), .Y(\nxt_reg_map[3][0] ) );
  NOR2X1 U222 ( .A(n164), .B(n154), .Y(n156) );
  INVX1 U223 ( .A(n165), .Y(\nxt_reg_map[2][7] ) );
  MUX2X1 U224 ( .B(bit_period[7]), .A(pwdata[7]), .S(n166), .Y(n165) );
  INVX1 U225 ( .A(n167), .Y(\nxt_reg_map[2][6] ) );
  MUX2X1 U226 ( .B(bit_period[6]), .A(pwdata[6]), .S(n166), .Y(n167) );
  INVX1 U227 ( .A(n168), .Y(\nxt_reg_map[2][5] ) );
  MUX2X1 U228 ( .B(bit_period[5]), .A(pwdata[5]), .S(n166), .Y(n168) );
  INVX1 U229 ( .A(n169), .Y(\nxt_reg_map[2][4] ) );
  MUX2X1 U230 ( .B(bit_period[4]), .A(pwdata[4]), .S(n166), .Y(n169) );
  INVX1 U231 ( .A(n170), .Y(\nxt_reg_map[2][3] ) );
  MUX2X1 U232 ( .B(bit_period[3]), .A(pwdata[3]), .S(n166), .Y(n170) );
  INVX1 U233 ( .A(n171), .Y(\nxt_reg_map[2][2] ) );
  MUX2X1 U234 ( .B(bit_period[2]), .A(pwdata[2]), .S(n166), .Y(n171) );
  MUX2X1 U235 ( .B(n172), .A(n150), .S(n166), .Y(\nxt_reg_map[2][1] ) );
  INVX1 U236 ( .A(pwdata[1]), .Y(n150) );
  INVX1 U237 ( .A(bit_period[1]), .Y(n172) );
  MUX2X1 U238 ( .B(n173), .A(n152), .S(n166), .Y(\nxt_reg_map[2][0] ) );
  NOR2X1 U239 ( .A(n174), .B(n154), .Y(n166) );
  NAND3X1 U240 ( .A(pwrite), .B(psel), .C(n175), .Y(n154) );
  INVX1 U241 ( .A(n176), .Y(n175) );
  OAI21X1 U242 ( .A(n141), .B(n140), .C(penable), .Y(n176) );
  INVX1 U243 ( .A(pwdata[0]), .Y(n152) );
  INVX1 U244 ( .A(bit_period[0]), .Y(n173) );
  AND2X1 U245 ( .A(n177), .B(N99), .Y(data_read) );
  NOR3X1 U246 ( .A(n138), .B(pwrite), .C(n137), .Y(N99) );
  NAND2X1 U247 ( .A(penable), .B(psel), .Y(n137) );
  NOR2X1 U248 ( .A(n178), .B(n179), .Y(n138) );
  NAND2X1 U249 ( .A(n180), .B(n181), .Y(N97) );
  AOI21X1 U250 ( .A(data_size[0]), .B(n140), .C(n182), .Y(n181) );
  OAI22X1 U251 ( .A(n164), .B(n163), .C(n183), .D(n184), .Y(n182) );
  NAND2X1 U252 ( .A(n185), .B(n179), .Y(n184) );
  MUX2X1 U253 ( .B(\reg_map[0][0] ), .A(\reg_map[1][0] ), .S(paddr[0]), .Y(
        n183) );
  INVX1 U254 ( .A(bit_period[8]), .Y(n163) );
  AOI22X1 U255 ( .A(bit_period[0]), .B(n186), .C(\reg_map[6][0] ), .D(n177), 
        .Y(n180) );
  NAND2X1 U256 ( .A(n187), .B(n188), .Y(N96) );
  AOI21X1 U257 ( .A(data_size[1]), .B(n140), .C(n189), .Y(n188) );
  OAI21X1 U258 ( .A(n164), .B(n162), .C(n190), .Y(n189) );
  NAND3X1 U259 ( .A(\reg_map[1][1] ), .B(paddr[0]), .C(n191), .Y(n190) );
  NOR2X1 U260 ( .A(paddr[2]), .B(paddr[1]), .Y(n191) );
  INVX1 U261 ( .A(bit_period[9]), .Y(n162) );
  AOI22X1 U262 ( .A(bit_period[1]), .B(n186), .C(\reg_map[6][1] ), .D(n177), 
        .Y(n187) );
  NAND2X1 U263 ( .A(n192), .B(n193), .Y(N95) );
  AOI22X1 U264 ( .A(bit_period[10]), .B(n194), .C(data_size[2]), .D(n140), .Y(
        n193) );
  AOI22X1 U265 ( .A(bit_period[2]), .B(n186), .C(\reg_map[6][2] ), .D(n177), 
        .Y(n192) );
  NAND2X1 U266 ( .A(n195), .B(n196), .Y(N94) );
  AOI22X1 U267 ( .A(bit_period[11]), .B(n194), .C(data_size[3]), .D(n140), .Y(
        n196) );
  AOI22X1 U268 ( .A(bit_period[3]), .B(n186), .C(\reg_map[6][3] ), .D(n177), 
        .Y(n195) );
  NAND2X1 U269 ( .A(n197), .B(n198), .Y(N93) );
  AOI22X1 U270 ( .A(bit_period[12]), .B(n194), .C(\reg_map[4][4] ), .D(n140), 
        .Y(n198) );
  AOI22X1 U271 ( .A(bit_period[4]), .B(n186), .C(\reg_map[6][4] ), .D(n177), 
        .Y(n197) );
  NAND2X1 U272 ( .A(n199), .B(n200), .Y(N92) );
  AOI22X1 U273 ( .A(bit_period[13]), .B(n194), .C(\reg_map[4][5] ), .D(n140), 
        .Y(n200) );
  AOI22X1 U274 ( .A(bit_period[5]), .B(n186), .C(\reg_map[6][5] ), .D(n177), 
        .Y(n199) );
  NAND2X1 U275 ( .A(n201), .B(n202), .Y(N91) );
  AOI22X1 U276 ( .A(\reg_map[3][6] ), .B(n194), .C(\reg_map[4][6] ), .D(n140), 
        .Y(n202) );
  AOI22X1 U277 ( .A(bit_period[6]), .B(n186), .C(\reg_map[6][6] ), .D(n177), 
        .Y(n201) );
  NAND2X1 U278 ( .A(n203), .B(n204), .Y(N90) );
  AOI22X1 U279 ( .A(\reg_map[3][7] ), .B(n194), .C(\reg_map[4][7] ), .D(n140), 
        .Y(n204) );
  INVX1 U280 ( .A(n153), .Y(n140) );
  NAND3X1 U281 ( .A(n178), .B(n185), .C(paddr[2]), .Y(n153) );
  INVX1 U282 ( .A(n164), .Y(n194) );
  NAND2X1 U283 ( .A(paddr[0]), .B(paddr[1]), .Y(n164) );
  AOI22X1 U284 ( .A(bit_period[7]), .B(n186), .C(\reg_map[6][7] ), .D(n177), 
        .Y(n203) );
  NOR2X1 U285 ( .A(n185), .B(n179), .Y(n177) );
  INVX1 U286 ( .A(paddr[2]), .Y(n179) );
  INVX1 U287 ( .A(n174), .Y(n186) );
  NAND2X1 U288 ( .A(n141), .B(n178), .Y(n174) );
  INVX1 U289 ( .A(paddr[0]), .Y(n178) );
  NOR2X1 U290 ( .A(n185), .B(paddr[2]), .Y(n141) );
  INVX1 U291 ( .A(paddr[1]), .Y(n185) );
endmodule

