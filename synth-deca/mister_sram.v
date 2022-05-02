
//Wrapper sRam - Sdram
module mister_sram (
    output [12:0] SDRAM_A,
	inout  [15:0] SDRAM_DQ,
	output  [1:0] SDRAM_BA,
    output        SDRAM_DQML,
	output        SDRAM_DQMH,
	output        SDRAM_nWE,
    output        SDRAM_nCAS,
	output        SDRAM_nRAS,
	output        SDRAM_nCS,
	output        SDRAM_CKE,

//SDRAM interface with lower latency
	input  [20:0] SRAM_A,
	inout  [ 7:0] SRAM_DQ,
	input         SRAM_nCE,
	input         SRAM_nOE,
	input         SRAM_nWE
);

assign SDRAM_CKE  = SRAM_nCE;
assign SDRAM_nCAS = SRAM_nOE;
assign SDRAM_nWE  = SRAM_nWE;
assign SDRAM_nCS  = ~SRAM_nCE;

assign SDRAM_DQ[11] = SRAM_nWE ? 1'bZ : SRAM_DQ[0];
assign SDRAM_DQ[10] = SRAM_nWE ? 1'bZ : SRAM_DQ[1];
assign SDRAM_DQ[ 8] = SRAM_nWE ? 1'bZ : SRAM_DQ[2];
assign SDRAM_DQ[ 9] = SRAM_nWE ? 1'bZ : SRAM_DQ[3];
assign SDRAM_DQ[ 7] = SRAM_nWE ? 1'bZ : SRAM_DQ[4];
assign SDRAM_DQ[ 6] = SRAM_nWE ? 1'bZ : SRAM_DQ[5];
assign SDRAM_DQ[ 5] = SRAM_nWE ? 1'bZ : SRAM_DQ[6];
assign SDRAM_DQ[ 4] = SRAM_nWE ? 1'bZ : SRAM_DQ[7];

assign SRAM_DQ[ 0] = SRAM_nWE ? SDRAM_DQ[11] : 1'bZ;
assign SRAM_DQ[ 1] = SRAM_nWE ? SDRAM_DQ[10] : 1'bZ;
assign SRAM_DQ[ 2] = SRAM_nWE ? SDRAM_DQ[ 8] : 1'bZ;
assign SRAM_DQ[ 3] = SRAM_nWE ? SDRAM_DQ[ 9] : 1'bZ;
assign SRAM_DQ[ 4] = SRAM_nWE ? SDRAM_DQ[ 7] : 1'bZ;
assign SRAM_DQ[ 5] = SRAM_nWE ? SDRAM_DQ[ 6] : 1'bZ;
assign SRAM_DQ[ 6] = SRAM_nWE ? SDRAM_DQ[ 5] : 1'bZ;
assign SRAM_DQ[ 7] = SRAM_nWE ? SDRAM_DQ[ 4] : 1'bZ;

assign SDRAM_DQ[15] = SRAM_A[ 0];
assign SDRAM_DQ[14] = SRAM_A[ 1];
assign SDRAM_DQ[13] = SRAM_A[ 2];
assign SDRAM_DQ[12] = SRAM_A[ 3];
assign SDRAM_A [ 4] = SRAM_A[ 4];
assign SDRAM_A [ 7] = SRAM_A[ 5];
assign SDRAM_A [12] = SRAM_A[ 6];
assign SDRAM_A [11] = SRAM_A[ 7];
assign SDRAM_A [ 9] = SRAM_A[ 8];
assign SDRAM_A [ 8] = SRAM_A[ 9];
assign SDRAM_A [ 2] = SRAM_A[10];
assign SDRAM_A [ 1] = SRAM_A[11];
assign SDRAM_A [ 0] = SRAM_A[12];
assign SDRAM_A [10] = SRAM_A[13];
assign SDRAM_BA[ 1] = SRAM_A[14];
assign SDRAM_BA[ 0] = SRAM_A[15];
assign SDRAM_DQ[ 3] = SRAM_A[16];
assign SDRAM_DQ[ 2] = SRAM_A[17];
assign SDRAM_DQ[ 1] = SRAM_A[18];
assign SDRAM_A [ 3] = SRAM_A[19];
assign SDRAM_DQ[ 0] = SRAM_A[20];

endmodule