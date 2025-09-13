
# Absolute path to armips
ARMIPS=/home/mungdaal321/armips/build/armips

all: hellogpu.ps-exe

hellogpu.bin: hellogpu.s
	$(ARMIPS) hellogpu.s

hellogpu.ps-exe: hellogpu.bin bin2exe.py
	python3 bin2exe.py hellogpu.bin hellogpu.ps-exe

clean:
	rm -f hellogpu.bin hellogpu.ps-exe

