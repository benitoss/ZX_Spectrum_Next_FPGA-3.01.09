`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:00:25 07/20/2018 
// Design Name: 
// Module Name:    joydecoder 
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

module joystick_serial 
(
    //-------------------------------------------
    input  wire clk_i,      //si reloj de entrada en este caso 1.3888Mhz 
    input  wire joy_data_i, //datos serializados patilla viene de la patilla 9 integrado
    output wire joy_clk_o,  //va a patilla 11 integrado
    output wire joy_load_o, //este reloj negado se usa directamente en las patillas 12 y 13
    //-----------------------------------------
    output wire joy1_up_o,
    output wire joy1_down_o,
    output wire joy1_left_o,
    output wire joy1_right_o,
    output wire joy1_fire1_o,
    output wire joy1_fire2_o,

    output wire joy2_up_o,
    output wire joy2_down_o,
    output wire joy2_left_o,
    output wire joy2_right_o,
    output wire joy2_fire1_o,
    output wire joy2_fire2_o
);
  
  // Divisor de relojes
  reg [7:0] delay_count;
 initial begin
    delay_count = 8'h00;
 end

  wire ena_x;
  
  always @ (posedge clk_i) begin
    begin
      delay_count <= delay_count + 1'b1;       
    end
  end
    
  assign ena_x = delay_count[1];  // clk/2 = 50 Mhz
  
  //Gestion de Joystick
// wire [11:0] j1 , j2;
   reg [11:0] joy1  = 12'hFFF, joy2  = 12'hFFF;   // CB RLDU
   reg joy_renew = 1'b1;
   reg [4:0]joy_count = 5'd0;
   
   assign joy_clk_o    = ena_x;
   assign joy_load_o   = joy_renew;
  
   assign joy1_up_o    = joy1[0];     
   assign joy1_down_o  = joy1[1];
   assign joy1_left_o  = joy1[2];
   assign joy1_right_o = joy1[3];
   assign joy1_fire1_o = joy1[4];
   assign joy1_fire2_o = joy1[5];
   assign joy2_up_o    = joy2[0];   
   assign joy2_down_o  = joy2[1];
   assign joy2_left_o  = joy2[2];
   assign joy2_right_o = joy2[3];
   assign joy2_fire1_o = joy2[4];
   assign joy2_fire2_o = joy2[5];
  
  always @(posedge ena_x) 
  begin 
      if (joy_count == 5'd0) 
          begin
           joy_renew <= 1'b0;
          end 
      else 
          begin
           joy_renew <= 1'b1;
          end

      if (joy_count == 5'd17) 
          begin
             joy_count <= 5'd0;
          end
      else 
          begin
             joy_count <= joy_count + 1'd1;
          end      
  end

   always @(posedge ena_x) begin
         case (joy_count)
            5'd16 : joy1[0]  <= joy_data_i;   //  1p up
            5'd15 : joy1[4]  <= joy_data_i;   //  1p fire1
            5'd14 : joy1[1]  <= joy_data_i;   //  1p down
            5'd13 : joy1[2]  <= joy_data_i;   //  1p left
            5'd12 : joy1[3]  <= joy_data_i;   //  1p right
            5'd11 : joy1[5]  <= joy_data_i;   //  1p fire2
            
            5'd8  : joy2[0]  <= joy_data_i;   //  2p up
            5'd7  : joy2[4]  <= joy_data_i;   //  2p fire1
            5'd6  : joy2[1]  <= joy_data_i;   //  2p down
            5'd5  : joy2[2]  <= joy_data_i;   //  2p left
            5'd4  : joy2[3]  <= joy_data_i;   //  2p right
            5'd3  : joy2[5]  <= joy_data_i;   //  2p fire2
         endcase              
      end
endmodule