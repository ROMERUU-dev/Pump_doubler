# SPDX-License-Identifier: Apache-2.0
#
# Regenerates lef/tt_um_regulated_pump.lef from mag/tt_um_regulated_pump.mag.
#
# Run it from the mag/ directory:
#
#   PDK_ROOT=<your pdk root> magic -dnull -noconsole \
#       -rcfile $PDK_ROOT/sky130A/libs.tech/magic/sky130A.magicrc mag/export_lef.tcl
#
# The "-hide -pinonly" flags matter. Without them Magic exports the whole net
# connected to each port label, which puts port geometry on li1/met1/met2/met3,
# merges ports that share a net into a single PIN, and makes the Tiny Tapeout
# pin check fail. With them each port becomes exactly one met4 rectangle, which
# is what the precheck expects. This is the same command the Tiny Tapeout analog
# template uses in magic_init_project.tcl.
#
# Re-exporting the GDS from this .mag is faithful: with the standard cells
# resolved from the PDK, "gds write" reproduces the committed GDS with zero
# geometry differences on every layer, verified by a KLayout XOR. Uncomment the
# "gds write" line below when the layout itself changes.

load tt_um_regulated_pump
lef write ../lef/tt_um_regulated_pump.lef -hide -pinonly
# gds write ../gds/tt_um_regulated_pump.gds
quit -noprompt
