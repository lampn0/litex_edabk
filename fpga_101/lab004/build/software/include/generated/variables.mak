PACKAGES=libc libcompiler_rt libbase libfatfs liblitespi liblitedram libliteeth liblitesdcard liblitesata bios
PACKAGE_DIRS=/home/lam/data2/edabk/litex/litex/litex/soc/software/libc /home/lam/data2/edabk/litex/litex/litex/soc/software/libcompiler_rt /home/lam/data2/edabk/litex/litex/litex/soc/software/libbase /home/lam/data2/edabk/litex/litex/litex/soc/software/libfatfs /home/lam/data2/edabk/litex/litex/litex/soc/software/liblitespi /home/lam/data2/edabk/litex/litex/litex/soc/software/liblitedram /home/lam/data2/edabk/litex/litex/litex/soc/software/libliteeth /home/lam/data2/edabk/litex/litex/litex/soc/software/liblitesdcard /home/lam/data2/edabk/litex/litex/litex/soc/software/liblitesata /home/lam/data2/edabk/litex/litex/litex/soc/software/bios
LIBS=libc libcompiler_rt libbase libfatfs liblitespi liblitedram libliteeth liblitesdcard liblitesata
TRIPLE=riscv32-unknown-elf
CPU=vexriscv
CPUFAMILY=riscv
CPUFLAGS=-march=rv32im     -mabi=ilp32 -D__vexriscv__
CPUENDIANNESS=little
CLANG=0
CPU_DIRECTORY=/home/lam/data2/edabk/litex/litex/litex/soc/cores/cpu/vexriscv
SOC_DIRECTORY=/home/lam/data2/edabk/litex/litex/litex/soc
PICOLIBC_DIRECTORY=/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data
COMPILER_RT_DIRECTORY=/home/lam/data2/edabk/litex/pythondata-software-compiler_rt/pythondata_software_compiler_rt/data
export BUILDINC_DIRECTORY
BUILDINC_DIRECTORY=/home/lam/data2/edabk/litex/fpga_101/lab004/build/software/include
LIBC_DIRECTORY=/home/lam/data2/edabk/litex/litex/litex/soc/software/libc
LIBCOMPILER_RT_DIRECTORY=/home/lam/data2/edabk/litex/litex/litex/soc/software/libcompiler_rt
LIBBASE_DIRECTORY=/home/lam/data2/edabk/litex/litex/litex/soc/software/libbase
LIBFATFS_DIRECTORY=/home/lam/data2/edabk/litex/litex/litex/soc/software/libfatfs
LIBLITESPI_DIRECTORY=/home/lam/data2/edabk/litex/litex/litex/soc/software/liblitespi
LIBLITEDRAM_DIRECTORY=/home/lam/data2/edabk/litex/litex/litex/soc/software/liblitedram
LIBLITEETH_DIRECTORY=/home/lam/data2/edabk/litex/litex/litex/soc/software/libliteeth
LIBLITESDCARD_DIRECTORY=/home/lam/data2/edabk/litex/litex/litex/soc/software/liblitesdcard
LIBLITESATA_DIRECTORY=/home/lam/data2/edabk/litex/litex/litex/soc/software/liblitesata
BIOS_DIRECTORY=/home/lam/data2/edabk/litex/litex/litex/soc/software/bios