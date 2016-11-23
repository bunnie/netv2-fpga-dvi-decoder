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

`timescale 1 ps / 1ps

module decode_terc4 (
  input            clkin,    // pixel clock input
  input            rstin,    // async. reset input (active high)
  input      [9:0] din,      // data inputs: expect registered
  output reg [3:0] dout      // data outputs
);
   reg [9:0] 	   din_r;
   
   always @(posedge clkin) begin
      if( rstin ) begin
	 dout[3:0] <= 4'h0;
	 din_r <= 10'b0;
      end else begin
	 din_r <= din;
	 case (din_r[9:0])
	   10'b1010011100: dout[3:0] <= 4'b0000;
	   10'b1001100011: dout[3:0] <= 4'b0001;
	   10'b1011100100: dout[3:0] <= 4'b0010;
	   10'b1011100010: dout[3:0] <= 4'b0011;
	   10'b0101110001: dout[3:0] <= 4'b0100;
	   10'b0100011110: dout[3:0] <= 4'b0101;
	   10'b0110001110: dout[3:0] <= 4'b0110;
	   10'b0100111100: dout[3:0] <= 4'b0111;
	   10'b1011001100: dout[3:0] <= 4'b1000;
	   10'b0100111001: dout[3:0] <= 4'b1001;
	   10'b0110011100: dout[3:0] <= 4'b1010;
	   10'b1011000110: dout[3:0] <= 4'b1011;
	   10'b1010001110: dout[3:0] <= 4'b1100;
	   10'b1001110001: dout[3:0] <= 4'b1101;
	   10'b0101100011: dout[3:0] <= 4'b1110;
	   10'b1011000011: dout[3:0] <= 4'b1111;
	   // no default to allow for maximum coding flexibility...
	 endcase // case (din_q)
      end // else: !if( rstin )
   end // always @ (posedge clkin or posedge rstin)

endmodule // decode_terc4

