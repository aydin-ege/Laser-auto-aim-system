// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sun Dec 22 11:55:06 2019
// Host        : Ege-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Desktop/EE102/Project/VHDL/FinalProject/FinalProject.srcs/sources_1/ip/mult_gen_1/mult_gen_1_sim_netlist.v
// Design      : mult_gen_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_1,mult_gen_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_14,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module mult_gen_1
   (CLK,
    A,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [17:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [25:0]P;

  wire [17:0]A;
  wire CLK;
  wire [25:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "18" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "11110000" *) 
  (* C_B_WIDTH = "8" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "2" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "25" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_1_mult_gen_v12_0_14 U0
       (.A(A),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "18" *) (* C_B_TYPE = "1" *) 
(* C_B_VALUE = "11110000" *) (* C_B_WIDTH = "8" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "2" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "25" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_14" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_1_mult_gen_v12_0_14
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [17:0]A;
  input [7:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [25:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [17:0]A;
  wire CLK;
  wire [25:4]\^P ;
  wire [3:0]NLW_i_mult_P_UNCONNECTED;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign P[25:4] = \^P [25:4];
  assign P[3] = \<const0> ;
  assign P[2] = \<const0> ;
  assign P[1] = \<const0> ;
  assign P[0] = \<const0> ;
  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "18" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "11110000" *) 
  (* C_B_WIDTH = "8" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "2" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "25" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_1_mult_gen_v12_0_14_viv i_mult
       (.A(A),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b0),
        .CLK(CLK),
        .P({\^P ,NLW_i_mult_P_UNCONNECTED[3:0]}),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
g7azmhtm6FcP7uNFjuXJjN8Z6yccOPk3SSjzvKB27peFKmnPmQmov5+YTGwYqqN9LpdyiUExk8K6
vPnJqontvQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
MFrqn2K0Cr7TmQ5al162oDGiY83d+AkTWOgFyXPYrTNznygR/tx44RAp24ytphNK9p6shs2EFMg/
Qqz0l8DCWiVEoJ/T8vMpnAn7Y+poGVGS1qAR3qE2njrl81VcGBZJeFaWIudhfr/DLTuuf2T/dWDU
YpelM3KbfYNPPiPy8PU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FZca5XZouG+/BYoQ8qrJTmnJanku4IprIWRkO6VciHehE5WehR0wsZJhfKlqLEeY1oTPA4bXaxmY
NjYkrop4EOwW8t47/hj2kFLI1OKUAE/TAhCGg/aNSOViUbB3dUomG/y+TBuDt9L6g0Arj1vb/5Pt
IChc5ZdEfRr1lJMTpFfP+5qmEH6lePPdzgPZATPB4Zrj0P6EyiEsU1FKBuAKd9iYNGiLCxVomaz0
3/RwK2Nl+/l4mc7PJt5Hso+4s1qHb4s2wD+OgbIwdH26ZkEnKVFpaLiuWQKu9uhDLGnsBMPf7XDE
p29f+mrvP9Zi/3nonA2aBKrTwR7XuH+ZYoakxA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jP68OjlYJglq3zpmKrXOhq7Sex8XNW8fQKp4hUNmuw06OOoKhQASNTnjtyVjAIk/VXb64ViBu1ds
cNMJybDSWBhnChfJq4h9PNybShGJXxSm3NDOo5wUHKf10Eti3fSotB9rVks+tNdTEZo4O97kgfdD
G1FNOqlsYcQiShEGLLiEQ2yYtgJBxJ+jc8mFjIEfPhAYy1ElrvtFEpnhkNS2LfE7xdWOQdO/XoKK
ibeY08pgncTI3pvO6TMbXushf0AX2S7hgfk8ysZrT+0gktqFrJnyR6oljS6VVPLtRNW2vo/cC8XQ
Bzvwwt4cpSo5KLS4XxB6qClZipItck2AUEdIbQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
o7jAZIoXlFbFtDYmtXhfRBlb07dhBb6Wp03mlT4T0FXtvccSHWhWZgc+VUNwt6TohLihOwvSipPP
XVXpGL4pUVYNdQBCVpFzhMkt6jhyUgsF5t10yI5Of6YEfQrDHigceoBukM3+/zJHPprrPQE6FUvC
wXSGhBCXnHJs1R+n4l0714w8/WftPQhlD9QGQp1qT2VARQXUKBRxcRjxe9TcLfs0P4xnN7uHu0R6
JTmV+MHmhGpetSZGx+B2Wa1MQofUPURqwE70IwBoUhdXH8+39DT5I6x2+wMY6RcVATnhNd2BCgPd
RzAhwfrcqRiU9aB+eNNdFR8ve9M2nGMmV2JxZg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Cl1Dz+fZIDYEIQuUd0pSg+5jknmtX/JERd+yOZ2SRaVra/4pU/eCTjEXMzhz4VFGYB6dgUxMsGBk
nL2WNdn/uaSPpi6mNF0UHQvZik4pUkYPrnRbFveVqW8i1t95SG0RW96uD19206lWrp5U1lqc4fH7
sfKHi8ZpU3MAg0DOO0E=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Qqp76m2aV9ue8Qai7QUavb+lhRYdu/txrnwYLzwTe0vS0S2OD1vxr8VeIT3bF/ZuXlTGm4S/UCSF
bgOPp7VqEOeGNfsSPK+VpQ+foQMENCQYccwKquBDSg/sLjpPK9uuoGLBLxjw2OwsRzplVFXiPcRN
LYK1/FmCP7RJBNgmhh/ti99a+WSl6i2YIIRGocNplQlG8FXq8ZTTHd/x2Gtdf/zGvJOy/fNsos6S
Oq9yJ0rMmbGeWbri5c04gZM08pUmXBsivgOHm2IVEZZFM4SBqrsi0xa52hs2kelc3iKJcWiTvU3X
0fJP9qNFuIjXBPPZvEYwhVtIh6DwiIC2viSscQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
JXYBApo44XehBFsVVC577sUtjJf9nhtcN25ee9AnyfnW+nkYx06TS4Cg7tnSM0yaV97u6s3bngzO
SdRfZPBN0bFK46o5cj31NAiupCnpe2TVkEuP1ZycXfCn4U+DDMbbTLdcjwjq2bpCKg8jPelTKmSx
2VeLUzKvhQ1aJZE8a0Xpf/C3/cQRCyHDSXHW49zoSNWLZFAgdyUtG/nJM9lbrwRWDvDBkotuEjIb
w5HOh6MvfMgSvetNzuDgCeFPAgX1vWZTY7GwEyWuYYKAns2AFPegAIrY+HxbtNac2pHpkwN4k1zv
M7dCrq+0ZNtP32cU1qxyyBcL8OhZnff3/V0yKQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
yWyHY3YwV/VwAybmtzTm81OcbHx06c3e8Bbv1y3uE9S3TNThNiVNbzTrGe1WfofCnr6SKljinCTR
1uxWNrY4tYSlLePOFEKCxzAnq7H8diVW2Zce4Ftv16va1VS8R+/UgHs9CVHs2oYHj6+1TnxnDeBH
wkijlw1iN/elLlLUpkJJIlT6UYSFKwNBUCYtzQVLnDl6Z4nmbrxCaJANKgY9dgrkXNQjAcYG/bv0
zCFh2PudFOPyACFmUgS4y/kqQHnTtrMS8kq9SvLSZLVW0oPEJeyUkHN7okVsKghKSPLjR8TMQhsG
Sp2ozpYfyyeP2fzTRwdEdBsywlcVax+q1O1i7g==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17152)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
