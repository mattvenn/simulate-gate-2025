all: sim

show_cells:
	klayout -l $(PDK_ROOT)/sky130A/libs.tech/klayout/tech/sky130A.lyp $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/gds/sky130_fd_sc_hd.gds

check:
	ngspice ci.spice
	python3 check.py check.txt

sim: simulation.spice
	# run the simulation
	ngspice $^
