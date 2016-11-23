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
//
// Module: 	DRAM16XN
//
// Description: Distributed SelectRAM example
//		Dual Port 16 x N-bit
//
//---------------------------------------------------------------------------------------

module DRAM16XN #(parameter data_width = 20)
                 (
                  DATA_IN,
                  ADDRESS,
                  ADDRESS_DP,
                  WRITE_EN,
                  CLK,
                  O_DATA_OUT,
                  O_DATA_OUT_DP);

input [data_width-1:0]DATA_IN;
input [3:0] ADDRESS;
input [3:0] ADDRESS_DP;
input WRITE_EN;
input CLK;

output [data_width-1:0]O_DATA_OUT_DP;
output [data_width-1:0]O_DATA_OUT;

genvar i;
generate
  for(i = 0 ; i < data_width ; i = i + 1) begin : dram16s
    RAM16X1D i_RAM16X1D_U(  
      .D(DATA_IN[i]),        //insert input signal
      .WE(WRITE_EN),         //insert Write Enable signal
      .WCLK(CLK),            //insert Write Clock signal
      .A0(ADDRESS[0]),       //insert Address 0 signal port SPO
      .A1(ADDRESS[1]),       //insert Address 1 signal port SPO
      .A2(ADDRESS[2]),       //insert Address 2 signal port SPO
      .A3(ADDRESS[3]),       //insert Address 3 signal port SPO
      .DPRA0(ADDRESS_DP[0]), //insert Address 0 signal dual port DPO
      .DPRA1(ADDRESS_DP[1]), //insert Address 1 signal dual port DPO
      .DPRA2(ADDRESS_DP[2]), //insert Address 2 signal dual port DPO
      .DPRA3(ADDRESS_DP[3]), //insert Address 3 signal dual port DPO
      .SPO(O_DATA_OUT[i]),   //insert output signal SPO
      .DPO(O_DATA_OUT_DP[i]) //insert output signal DPO
    );
  end
endgenerate

endmodule

