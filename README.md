# NeTV2 FPGA DVI decoder block

This block implements DVI/HDMI decoding using the
ISERDES primitives. It uses a master/slave sampling
with 90-degree out of phase IDELAY primitives to dynamically
center the sampling point in the data eye. Each
channel has its own independent feedback loop. The
data is then fed through an 8-to-10 gearbox and
channel bonded to absorb cable skew that exceeds a
bit time (e.g., the ability of the master/slave
sampling to compensate for delays). 

It's tested to work with Vivado 2016.1.

Portions of this code trace its lineage back to
Xilinx app notes, but portions are also original
works of the author. To the extent that GPLv3 can
be legally applied that is the preferred license for
this embodiment.

