-- Z80 IM2 DEVICE
-- Copyright 2020 Alvin Albrecht
--
-- This file is part of the ZX Spectrum Next Project
-- <https://gitlab.com/SpectrumNext/ZX_Spectrum_Next_FPGA/tree/master/cores>
--
-- The ZX Spectrum Next FPGA source code is free software: you can 
-- redistribute it and/or modify it under the terms of the GNU General 
-- Public License as published by the Free Software Foundation, either 
-- version 3 of the License, or (at your option) any later version.
--
-- The ZX Spectrum Next FPGA source code is distributed in the hope 
-- that it will be useful, but WITHOUT ANY WARRANTY; without even the 
-- implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
-- PURPOSE.  See the GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with the ZX Spectrum Next FPGA source code.  If not, see 
-- <https://www.gnu.org/licenses/>.

--
-- This module completely handles interrupt logic for zxn peripherals.
-- It also implements "pulsed" interrupt logic so is somewhat specific
-- to the zx spectrum architecture.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity im2_peripheral is
   generic (
      constant VEC_BITS       : positive := 4
   );
   port (
      i_CLK_28                : in std_logic;
      i_CLK_CPU               : in std_logic;
      i_reset                 : in std_logic;
      
      i_m1_n                  : in std_logic;
      i_iorq_n                : in std_logic;
      
      i_mode_pulse_0_im2_1    : in std_logic;    -- select standard pulsed zx mode or im2 vector mode
      
      i_iei                   : in std_logic;    -- im2 daisy chain
      o_ieo                   : out std_logic;   -- im2 daisy chain
      
      i_reti_decode           : in std_logic;    -- reti opcode decode in progress
      i_reti_seen             : in std_logic;    -- reti opcode found
      
      i_int_en                : in std_logic;    -- enable interrupts from this device
      i_int_req               : in std_logic;    -- interrupt request from this device (level active)
   
      i_int_status_clear      : in std_logic;    -- clear interrupt status bit if 1 (i_CLK_28)
      o_int_status            : out std_logic;   -- current state of interrupt status bit (i_CLK_28)

      o_int_n                 : out std_logic;   -- active low interrupt signal to z80 if in im2 mode
      o_pulse_en              : out std_logic;   -- active high signal for pulse interrupt counter valid one cycle
   
      i_vector                : in std_logic_vector(VEC_BITS-1 downto 0);
      o_vector                : out std_logic_vector(VEC_BITS-1 downto 0)
   );
end entity;

architecture rtl of im2_peripheral is

-- signal int_req_d           : std_logic;
   signal int_req_e           : std_logic;
   
   signal int_status          : std_logic;
   signal next_int_status     : std_logic;

   signal im2_int_req         : std_logic;
   signal im2_isr_serviced    : std_logic;

begin

   -- im2 device logic
   
   im2_logic: entity work.im2_device
   generic map (
      VEC_BITS          => VEC_BITS
   )
   port map (
      i_CLK_CPU         => i_CLK_CPU,
      i_reset_n         => i_mode_pulse_0_im2_1,
      
      i_m1_n            => i_m1_n,
      i_iorq_n          => i_iorq_n,
      
      i_int_req         => im2_int_req,
      o_int_n           => o_int_n,
      
      i_reti_decode     => i_reti_decode,
      i_reti_seen       => i_reti_seen,
      o_isr_serviced    => im2_isr_serviced,
      
      i_iei             => i_iei,
      o_ieo             => o_ieo,

      i_vec             => i_vector,
      o_vec             => o_vector
   );
   
   -- edge detect interrupt request
   
-- process (i_CLK_28)
-- begin
--    if rising_edge(i_CLK_28) then
--       if i_reset = '1' or i_int_status_clear = '1' or im2_isr_serviced = '1' then
--          int_req_d <= '0';
--       else
--          int_req_d <= i_int_req;
--       end if;
--    end if;
-- end process;
--   
-- int_req_e <= i_int_req and not int_req_d;
   
   int_req_e <= i_int_req;
   
   -- interrupt status register
   -- record of whether interrupt occurred, only cleared by write or im2 reset
   
   next_int_status <= (int_status or int_req_e) and (not i_int_status_clear) and (not im2_isr_serviced);
   
   process (i_CLK_28)
   begin
      if rising_edge(i_CLK_28) then
         if i_reset = '1' then
            int_status <= '0';
         else
            int_status <= next_int_status;
         end if;
      end if;
   end process;
   
   o_int_status <= int_status;
   
   -- im2 interrupt logic
   
   im2_int_req <= next_int_status and i_int_en;

   -- pulse interrupt logic
   
   o_pulse_en <= int_req_e and i_int_en;

end architecture;
