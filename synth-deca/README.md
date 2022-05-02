# ZX Spectrum Next - Deca port

01/04/22 DECA port by Shaeon and Somhic from Unamiga Reloaded core https://github.com/benitoss/ZX_Spectrum_Next_FPGA-3.01.09 by  @benitoss

**THIS PORT ONLY USES SRAM MEMORY. IT WORKS WELL WITH A DUAL SDRAM+SRAM MISTER MODULE WITH SEPARATED DQMH/L SIGNALS (3 extra pins)**. 

**Now compatible with [Deca Retro Cape 2](https://github.com/somhi/DECA_retro_cape_2)** (new location for 3 pins of old SDRAM modules). Otherwise see pinout below to connect everything through GPIOs.

**Features for Deca board**

* VGA 444 video output is available through GPIO. 
* Audio I2S Line out (3.5 jack green connector) and HDMI audio output
* Sigma-Delta audio available through GPIO
* Joystick available through GPIO. 
  * **Joystick power pin must be 2.5 V. DANGER: Connecting power pin above 2.6 V may damage the FPGA**
  * This core was tested with a Megadrive 6 button gamepad. A permanent high level is applied on pin 7 of DB9, so only works buttons B and C.

**Additional hardware required**

- SDRAM+SRAM dual module
  - Tested with a dual memory module v1.3 with 3 pins ([see connections](https://github.com/SoCFPGA-learning/DECA/tree/main/Projects/sdram_mister_deca) + [3pins](https://github.com/DECAfpga/DECA_board/blob/main/Sdram_mister_deca/README_3pins.md))
- PS/2 Keyboard connected to GPIO

##### Versions

* 220501 VGA version only

### STATUS

* Working fine 


### Binaries

Fins .sof and .svf binary bitstreams for this core at the corresponding category at https://github.com/DECAfpga/DECA_binaries

Flash bitstream directly from [command line](https://github.com/DECAfpga/DECA_binaries#flash-bitstream-to-fgpa-with-quartus) or from Quartus programmer.

### Instructions to compile the project:

* Load project in Quartus from /deca/[core_name]_deca.qpf

### Pinout connections:

![pinout_deca](pinout_deca.png)

MIDI pins are not used in this core.

For 444 video DAC use all VGA pins. For 333 video DAC connect MSB from addon to MSB of location assignment (e.g. connect pin VGAR2 from Waveshare addon to VGA_R[3] Deca pin).

