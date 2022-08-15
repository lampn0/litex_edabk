INCLUDE generated/output_format.ld
ENTRY(_start)

__DYNAMIC = 0;

INCLUDE generated/regions.ld

SECTIONS
{
	.text :
	{
		_ftext = .;
		*(.text .stub .text.* .gnu.linkonce.t.*)
		_etext = .;
	} > main_ram

	.rodata :
	{
		. = ALIGN(4);
		_frodata = .;
		*(.rodata .rodata.* .gnu.linkonce.r.*)
		*(.rodata1)
		_erodata = .;
	} > main_ram

	.data :
	{
		. = ALIGN(4);
		_fdata = .;
		*(.data .data.* .gnu.linkonce.d.*)
		*(.data1)
		_gp = ALIGN(16);
		*(.sdata .sdata.* .gnu.linkonce.s.*)
		_edata = .;
	} > main_ram

	.bss :
	{
		. = ALIGN(4);
		_fbss = .;
		*(.dynsbss)
		*(.sbss .sbss.* .gnu.linkonce.sb.*)
		*(.scommon)
		*(.dynbss)
		*(.bss .bss.* .gnu.linkonce.b.*)
		*(COMMON)
		. = ALIGN(4);
		_ebss = .;
		_end = .;
	} > sram
}

PROVIDE(_fstack = ORIGIN(sram) + LENGTH(sram) - 4);

PROVIDE(_fdata_rom = LOADADDR(.data));
PROVIDE(_edata_rom = LOADADDR(.data) + SIZEOF(.data));

_start.o: main.c \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/tinystdio/stdio.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/inttypes.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/newlib.h \
 /home/lam/data2/edabk/litex/fpga_101/lab004/build/software/include/../libc/picolibc.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/config.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/machine/ieeefp.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/features.h \
 /home/lam/data2/edabk/litex/linux-on-litex-vexriscv/riscv64-unknown-elf-gcc-8.1.0-2019.01.0-x86_64-linux-ubuntu14/lib/gcc/riscv64-unknown-elf/8.1.0/include/float.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/_intsup.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/_ansi.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/stdint.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/machine/_default_types.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/_stdint.h \
 /home/lam/data2/edabk/litex/linux-on-litex-vexriscv/riscv64-unknown-elf-gcc-8.1.0-2019.01.0-x86_64-linux-ubuntu14/lib/gcc/riscv64-unknown-elf/8.1.0/include/stddef.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/_locale.h \
 /home/lam/data2/edabk/litex/linux-on-litex-vexriscv/riscv64-unknown-elf-gcc-8.1.0-2019.01.0-x86_64-linux-ubuntu14/lib/gcc/riscv64-unknown-elf/8.1.0/include/stdarg.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/_types.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/machine/_types.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/stdlib.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/cdefs.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/machine/stdlib.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/alloca.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/string.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/strings.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/string.h \
 /home/lam/data2/edabk/litex/litex/litex/soc/cores/cpu/vexriscv/irq.h \
 /home/lam/data2/edabk/litex/litex/litex/soc/cores/cpu/vexriscv/system.h \
 /home/lam/data2/edabk/litex/litex/litex/soc/cores/cpu/vexriscv/csr-defs.h \
 /home/lam/data2/edabk/litex/fpga_101/lab004/build/software/include/generated/soc.h \
 /home/lam/data2/edabk/litex/fpga_101/lab004/build/software/include/generated/csr.h \
 /home/lam/data2/edabk/litex/litex/litex/soc/software/include/hw/common.h \
 /home/lam/data2/edabk/litex/litex/litex/soc/software/libbase/uart.h \
 /home/lam/data2/edabk/litex/litex/litex/soc/software/libbase/console.h

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/tinystdio/stdio.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/inttypes.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/newlib.h:

/home/lam/data2/edabk/litex/fpga_101/lab004/build/software/include/../libc/picolibc.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/config.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/machine/ieeefp.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/features.h:

/home/lam/data2/edabk/litex/linux-on-litex-vexriscv/riscv64-unknown-elf-gcc-8.1.0-2019.01.0-x86_64-linux-ubuntu14/lib/gcc/riscv64-unknown-elf/8.1.0/include/float.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/_intsup.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/_ansi.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/stdint.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/machine/_default_types.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/_stdint.h:

/home/lam/data2/edabk/litex/linux-on-litex-vexriscv/riscv64-unknown-elf-gcc-8.1.0-2019.01.0-x86_64-linux-ubuntu14/lib/gcc/riscv64-unknown-elf/8.1.0/include/stddef.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/_locale.h:

/home/lam/data2/edabk/litex/linux-on-litex-vexriscv/riscv64-unknown-elf-gcc-8.1.0-2019.01.0-x86_64-linux-ubuntu14/lib/gcc/riscv64-unknown-elf/8.1.0/include/stdarg.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/_types.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/machine/_types.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/stdlib.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/cdefs.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/machine/stdlib.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/alloca.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/string.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/strings.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/string.h:

/home/lam/data2/edabk/litex/litex/litex/soc/cores/cpu/vexriscv/irq.h:

/home/lam/data2/edabk/litex/litex/litex/soc/cores/cpu/vexriscv/system.h:

/home/lam/data2/edabk/litex/litex/litex/soc/cores/cpu/vexriscv/csr-defs.h:

/home/lam/data2/edabk/litex/fpga_101/lab004/build/software/include/generated/soc.h:

/home/lam/data2/edabk/litex/fpga_101/lab004/build/software/include/generated/csr.h:

/home/lam/data2/edabk/litex/litex/litex/soc/software/include/hw/common.h:

/home/lam/data2/edabk/litex/litex/litex/soc/software/libbase/uart.h:

/home/lam/data2/edabk/litex/litex/litex/soc/software/libbase/console.h:





main.o: main.c \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/tinystdio/stdio.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/inttypes.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/newlib.h \
 /home/lam/data2/edabk/litex/fpga_101/lab004/build/software/include/../libc/picolibc.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/config.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/machine/ieeefp.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/features.h \
 /home/lam/data2/edabk/litex/linux-on-litex-vexriscv/riscv64-unknown-elf-gcc-8.1.0-2019.01.0-x86_64-linux-ubuntu14/lib/gcc/riscv64-unknown-elf/8.1.0/include/float.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/_intsup.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/_ansi.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/stdint.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/machine/_default_types.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/_stdint.h \
 /home/lam/data2/edabk/litex/linux-on-litex-vexriscv/riscv64-unknown-elf-gcc-8.1.0-2019.01.0-x86_64-linux-ubuntu14/lib/gcc/riscv64-unknown-elf/8.1.0/include/stddef.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/_locale.h \
 /home/lam/data2/edabk/litex/linux-on-litex-vexriscv/riscv64-unknown-elf-gcc-8.1.0-2019.01.0-x86_64-linux-ubuntu14/lib/gcc/riscv64-unknown-elf/8.1.0/include/stdarg.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/_types.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/machine/_types.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/stdlib.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/cdefs.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/machine/stdlib.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/alloca.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/string.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/strings.h \
 /home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/string.h \
 /home/lam/data2/edabk/litex/litex/litex/soc/cores/cpu/vexriscv/irq.h \
 /home/lam/data2/edabk/litex/litex/litex/soc/cores/cpu/vexriscv/system.h \
 /home/lam/data2/edabk/litex/litex/litex/soc/cores/cpu/vexriscv/csr-defs.h \
 /home/lam/data2/edabk/litex/fpga_101/lab004/build/software/include/generated/soc.h \
 /home/lam/data2/edabk/litex/fpga_101/lab004/build/software/include/generated/csr.h \
 /home/lam/data2/edabk/litex/litex/litex/soc/software/include/hw/common.h \
 /home/lam/data2/edabk/litex/litex/litex/soc/software/libbase/uart.h \
 /home/lam/data2/edabk/litex/litex/litex/soc/software/libbase/console.h

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/tinystdio/stdio.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/inttypes.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/newlib.h:

/home/lam/data2/edabk/litex/fpga_101/lab004/build/software/include/../libc/picolibc.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/config.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/machine/ieeefp.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/features.h:

/home/lam/data2/edabk/litex/linux-on-litex-vexriscv/riscv64-unknown-elf-gcc-8.1.0-2019.01.0-x86_64-linux-ubuntu14/lib/gcc/riscv64-unknown-elf/8.1.0/include/float.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/_intsup.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/_ansi.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/stdint.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/machine/_default_types.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/_stdint.h:

/home/lam/data2/edabk/litex/linux-on-litex-vexriscv/riscv64-unknown-elf-gcc-8.1.0-2019.01.0-x86_64-linux-ubuntu14/lib/gcc/riscv64-unknown-elf/8.1.0/include/stddef.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/_locale.h:

/home/lam/data2/edabk/litex/linux-on-litex-vexriscv/riscv64-unknown-elf-gcc-8.1.0-2019.01.0-x86_64-linux-ubuntu14/lib/gcc/riscv64-unknown-elf/8.1.0/include/stdarg.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/_types.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/machine/_types.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/stdlib.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/cdefs.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/machine/stdlib.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/alloca.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/string.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/strings.h:

/home/lam/data2/edabk/litex/pythondata-software-picolibc/pythondata_software_picolibc/data/newlib/libc/include/sys/string.h:

/home/lam/data2/edabk/litex/litex/litex/soc/cores/cpu/vexriscv/irq.h:

/home/lam/data2/edabk/litex/litex/litex/soc/cores/cpu/vexriscv/system.h:

/home/lam/data2/edabk/litex/litex/litex/soc/cores/cpu/vexriscv/csr-defs.h:

/home/lam/data2/edabk/litex/fpga_101/lab004/build/software/include/generated/soc.h:

/home/lam/data2/edabk/litex/fpga_101/lab004/build/software/include/generated/csr.h:

/home/lam/data2/edabk/litex/litex/litex/soc/software/include/hw/common.h:

/home/lam/data2/edabk/litex/litex/litex/soc/software/libbase/uart.h:

/home/lam/data2/edabk/litex/litex/litex/soc/software/libbase/console.h:
