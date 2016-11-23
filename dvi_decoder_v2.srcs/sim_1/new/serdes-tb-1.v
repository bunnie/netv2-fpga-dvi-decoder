/*
    This program is free software: you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by
     the Free Software Foundation, either version 3 of the License, or
     (at your option) any later version.
 
     This program is distributed in the hope that it will be useful,
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     GNU General Public License for more details.
 
     You should have received a copy of the GNU General Public License
     along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 
     Copyright 2016 Andrew 'bunnie' Huang, all rights reserved 
 */
`timescale 1ns / 1ps

module serdes_tb_1;

   reg mhz200_clk;
   reg rx_clk;
   
   reg ex_reset;

   reg reset;
   wire p_clk;
   wire px5_clk;
   wire px1p25_clk;
   wire data_p;
   wire data_n;
   wire [9:0] deserialized;

   parameter PERIOD = 6.734;
   
   always begin
      rx_clk = 1'b0;
      #(PERIOD/2) rx_clk = 1'b1;
      #(PERIOD/2);
   end
   always begin
      mhz200_clk = 1'b0;
      #2.5 mhz200_clk = 1'b1;
      #2.5;
   end
   
   IDELAYCTRL IDELAYCTRL_inst (
			       .RDY(), // 1-bit output: Ready output
			       .REFCLK(mhz200_clk), // 1-bit input: Reference clock input
			       .RST(reset) // 1-bit input: Active high reset input
			       );
  //
  // PLL is used to generate three clocks:
  // 1. p_clk:    same rate as TMDS clock
  // 2. pclkx2:  double rate of pclk used for 5:10 soft gear box and ISERDES DIVCLK
  // 3. pclkx10: 10x rate of pclk used as IO clock
  //
   wire clkfb_2;
   wire clk_pixel_raw;
   wire clk_pixel_x5_raw;
   wire clk_pixel_x1p25_raw;
   wire clk_pixel_x1p25_dbg_raw;
   wire pll_lckd;
      
   MMCME2_BASE #(
		 .BANDWIDTH("OPTIMIZED"), // Jitter programming (OPTIMIZED, HIGH, LOW)
		 .DIVCLK_DIVIDE(1), // Master division value (1-106)
		 .CLKFBOUT_MULT_F(5.0), // Multiply value for all CLKOUT (2.000-64.000).
		 .CLKFBOUT_PHASE(0.0), // Phase offset in degrees of CLKFB (-360.000-360.000).
		 .CLKIN1_PERIOD(6.734), // 6.734ns -> 148.5MHz
		 // CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128)
		 .CLKOUT0_DIVIDE_F(5.0), // Divide amount for CLKOUT0 (1.000-128.000).
		 .CLKOUT1_DIVIDE(5),
		 .CLKOUT2_DIVIDE(1),
		 .CLKOUT3_DIVIDE(4),
		 .CLKOUT4_DIVIDE(4),
		 .CLKOUT5_DIVIDE(1),
		 .CLKOUT6_DIVIDE(1),
		 // CLKOUT0_DUTY_CYCLE - CLKOUT6_DUTY_CYCLE: Duty cycle for each CLKOUT (0.01-0.99).
		 .CLKOUT0_DUTY_CYCLE(0.5),
		 .CLKOUT1_DUTY_CYCLE(0.5),
		 .CLKOUT2_DUTY_CYCLE(0.5),
		 .CLKOUT3_DUTY_CYCLE(0.5),
		 .CLKOUT4_DUTY_CYCLE(0.5),
		 .CLKOUT5_DUTY_CYCLE(0.5),
		 .CLKOUT6_DUTY_CYCLE(0.5),
		 // CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
		 .CLKOUT0_PHASE(0.0),
		 .CLKOUT1_PHASE(0.0),
		 .CLKOUT2_PHASE(0.0),
		 .CLKOUT3_PHASE(0.0),
		 .CLKOUT4_PHASE(0.0),
		 .CLKOUT5_PHASE(0.0),
		 .CLKOUT6_PHASE(0.0),
		 .CLKOUT4_CASCADE("FALSE"), // Cascade CLKOUT4 counter with CLKOUT6 (FALSE, TRUE)
		 .REF_JITTER1(0.0), // Reference input jitter in UI (0.000-0.999).
		 .STARTUP_WAIT("FALSE") // Delays DONE until MMCM is locked (FALSE, TRUE)
		 )
   MMCME2_BASE_inst (
		     // Clock Outputs: 1-bit (each) output: User configurable clock outputs
		     .CLKOUT0(clk_pixel_raw), // 1-bit output: CLKOUT0
		     //.CLKOUT0B(CLKOUT0B), // 1-bit output: Inverted CLKOUT0
		     //.CLKOUT1(CLKOUT1), // 1-bit output: CLKOUT1
		     //.CLKOUT1B(CLKOUT1B), // 1-bit output: Inverted CLKOUT1
		     .CLKOUT2(clk_pixel_x5_raw), // 1-bit output: CLKOUT2
		     //.CLKOUT2B(CLKOUT2B), // 1-bit output: Inverted CLKOUT2
		     .CLKOUT3(clk_pixel_x1p25_raw), // 1-bit output: CLKOUT3
		     //.CLKOUT3B(CLKOUT3B), // 1-bit output: Inverted CLKOUT3
		     .CLKOUT4(clk_pixel_x1p25_dbg_raw), // 1-bit output: CLKOUT4
		     //.CLKOUT5(CLKOUT5), // 1-bit output: CLKOUT5
		     //.CLKOUT6(CLKOUT6), // 1-bit output: CLKOUT6
		     // Feedback Clocks: 1-bit (each) output: Clock feedback ports
		     .CLKFBOUT(clkfb_2), // 1-bit output: Feedback clock
		     //.CLKFBOUTB(CLKFBOUTB), // 1-bit output: Inverted CLKFBOUT
		     // Status Ports: 1-bit (each) output: MMCM status ports
		     .LOCKED(pll_lckd), // 1-bit output: LOCK
		     // Clock Inputs: 1-bit (each) input: Clock input
		     .CLKIN1(rx_clk), // 1-bit input: Clock
		     // Control Ports: 1-bit (each) input: MMCM control ports
		     .PWRDWN(1'b0), // 1-bit input: Power-down
		     .RST(1'b0), // 1-bit input: Reset
		     // Feedback Clocks: 1-bit (each) input: Clock feedback ports
		     .CLKFBIN(clkfb_2) // 1-bit input: Feedback clock
		     );

   // in this implementation, no deskew of source clock is done, since
   // refclk is mesochronous (fixed frequency but no known phase)
   // feedback to source-synchronize the clock
   // BUFG pclkfbk (.I(clkfbout), .O(clkfbin) );
   // BUFIO2FB pclkfbk_fb (.I(clkfbin), .O(clkfbin_fb) );
   
  //
  // Pixel Rate clock buffer
  //
   BUFG pclkbufg (.I(clk_pixel_raw), .O(p_clk));

   BUFR pclkx1p25bufg (.I(clk_pixel_x1p25_raw), .O(px1p25_clk));
   BUFG pclkx1p25bufgdbg (.I(clk_pixel_x1p25_dbg_raw), .O(px1p25_dbg_clk));  // global buffer to ILAs
   BUFIO pclkx5bufio (.I(clk_pixel_x5_raw), .O(px5_clk));

   wire tmds;
   reg [9:0]	datain;

   serialiser_10_to_1 ser_ch0(
			      .clk(p_clk),
			      .clk_x5(px5_clk),
			      .reset(reset),
			      .data(datain[9:0]),
			      .serial(tmds)
			      );
   
   OBUFDS obuf_ds (
		   .I(tmds),
		   .O(data_p),
		   .OB(data_n)
		   );

   reg 		bitslip;
   serdes_1_10_diff serdes(
			   .pclk(p_clk),
			   .pclkx5(px5_clk),
			   .pclkx1p25(px1p25_clk),
			   .din_p(data_p),
			   .din_n(data_n),
			   .dout(deserialized),
			   .bitslip(bitslip),
			   .reset(reset)
			   );
   
   always @ (posedge p_clk) begin
      reset <= ex_reset || !pll_lckd;
   end

   integer i;
   integer j;
   
   initial begin
      ex_reset = 0;
      datain = 10'h0;
      bitslip = 1'b0;
      
//      $stop;

      #10;
      ex_reset = 1;
      #100;
      ex_reset = 0;

      datain <= 10'h3ff;
      #(PERIOD*20);
      
      for( j = 0; j < 16; j = j + 1 ) begin      
	 for( i = 0; i < 20; i = i + 1 ) begin
	    if( i < 16 ) begin
	       datain <= i;
	    end else begin
	       datain <= 10'h3ff;
	    end
	    
	    if( i == 16 ) begin
	       bitslip <= 1'b1;
	    end else begin
	       bitslip <= 1'b0;
	    end
	    #PERIOD;
	 end
      end

      #100;

      $stop;
      
   end
   
   
endmodule
