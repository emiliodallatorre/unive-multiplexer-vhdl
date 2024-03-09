export GHDL_PREFIX=$(pwd)/ghdl-macos-11-llvm/lib/ghdl

echo Our GHDL prefix is now: GHDL_PREFIX=$GHDL_PREFIX

echo "Compiling design..."
 ghdl -a design.vhd

echo "Compiling testbench..."
 ghdl -a testbench.vhd

echo "Elaborating testbench..."
 ghdl -r testbench — vcd=wave.vcd