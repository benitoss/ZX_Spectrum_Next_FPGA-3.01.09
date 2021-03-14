`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:25:38 08/13/2020 
// Design Name: 
// Module Name:    vga_to_greyscale 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module vga_to_greyscale(
    input wire [9:0] r_in,
    input wire  [9:0] g_in,
    input wire  [9:0] b_in,
    output wire  [9:0] y_out
    );
	//y=0.299r+0.587g+0.114b; 

	//assign y_out = (r_in>>2)+(r_in>>5)+(g_in>>1)+(g_in>>4)+(b_in>>4)+(b_in>>5); 
	//assign y_out = (r_in>>2)+(r_in>>5)+(g_in>>1)+(g_in>>4)+(b_in>>3)+(b_in>>4); mal
	assign y_out = (r_in>>2)+(r_in>>5)+(g_in>>1)+(g_in>>4)+(b_in>>4)+(b_in>>4);

endmodule
