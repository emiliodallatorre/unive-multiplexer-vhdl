export GHDL_PREFIX=$(pwd)/ghdl-macos-11-llvm/lib/ghdl

echo Our GHDL prefix is now: GHDL_PREFIX=$GHDL_PREFIX

echo "Analyzing design..."
 ghdl -a design.vhd

echo "Analyzing testbench..."
 ghdl -a testbench.vhd

echo "Elaborating design..."
    ghdl -e MUX_4_1_TB



echo "Elaborating testbench..."
 ghdl -r MUX_4_1_TB --wave=output_waveform.ghw