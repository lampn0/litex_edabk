#!/usr/bin/env python3

from migen import *
from migen.genlib.cdc import MultiReg

from litex.build.generic_platform import *
from litex.build.altera import AlteraPlatform

from tick import *
from display import *
from bcd import *
from core import *

# IOs ----------------------------------------------------------------------------------------------

_io = [
    # Clk
    ("clk50", 0, Pins("Y2"), IOStandard("3.3-V LVTTL")),

    # Leds
    ("user_led_r", 0, Pins("G19"), IOStandard("3.3-V LVTTL")),

    # Switches
    ("user_sw", 0, Pins("AB28"), IOStandard("3.3-V LVTTL")),

    # Button
    ("key", 0, Pins("M23"), IOStandard("3.3-V LVTTL")),
    ("key", 1, Pins("M21"), IOStandard("3.3-V LVTTL")),
    ("key", 2, Pins("N21"), IOStandard("3.3-V LVTTL")),
    ("key", 3, Pins("R24"), IOStandard("3.3-V LVTTL")),


    ("cpu_reset", 0, Pins("C19"), IOStandard("3.3-V LVTTL")),

    # Seven Segment
    # ("seven_seg", 0, Pins("G18  F22  E17  L26  L25  J22  H22 "), IOStandard("3.3-V LVTTL")),
    # ("seven_seg", 1, Pins("M24  Y22  W21  W22  W25  U23  U24 "), IOStandard("3.3-V LVTTL")),
    ("seven_seg", 0, Pins("AA25 AA26 Y25  W26  Y26  W27  W28 "), IOStandard("3.3-V LVTTL")),
    ("seven_seg", 1, Pins("V21  U21  AB20 AA21 AD24 AF23 Y19 "), IOStandard("3.3-V LVTTL")),
    ("seven_seg", 2, Pins("AB19 AA19 AG21 AH21 AE19 AF19 AE18"), IOStandard("3.3-V LVTTL")),
    ("seven_seg", 3, Pins("AD18 AC18 AB18 AH19 AG19 AF18 AH18"), IOStandard("3.3-V LVTTL")),
    ("seven_seg", 4, Pins("AA17 AB16 AA16 AB17 AB15 AA15 AC17"), IOStandard("3.3-V LVTTL")),
    ("seven_seg", 5, Pins("AD17 AE17 AG17 AH17 AF17 AG18 AA14"), IOStandard("3.3-V LVTTL")),
]

# Platform -----------------------------------------------------------------------------------------

class Platform(AlteraPlatform):
    default_clk_name   = "clk50"
    default_clk_period = 1e9/50e6

    def __init__(self):
        AlteraPlatform.__init__(self, "EP4CE115F29C7", _io, toolchain="quartus")

# Design -------------------------------------------------------------------------------------------

# User button detection
class UserButtonPress(Module):
    def __init__(self, user_btn):
        self.rising = Signal()

        # # #

        _user_btn = Signal()
        _user_btn_d = Signal()

        # resynchronize user_btn
        self.specials += MultiReg(user_btn, _user_btn)
        # detect rising edge
        self.sync += [
            _user_btn_d.eq(user_btn),
            self.rising.eq(_user_btn & ~_user_btn_d)
        ]

# Create our platform (fpga interface)
platform = Platform()

# Create our main module (fpga description)
class Clock(Module):
    sys_clk_freq = int(50e6)
    def __init__(self):
        # Tick generation : timebase
        tick = Tick(self.sys_clk_freq, 1)
        self.submodules += tick

        # SevenSegmentDisplay
        # display = SevenSegmentDisplay(self.sys_clk_freq)
        display = SevenSegmentDisplay_noScanLed()
        self.submodules += display

        # Core : counts ss/mm/hh
        core = Core()
        self.submodules += core

        # set mm/hh
        btn0_press = UserButtonPress(platform.request("key", 0))
        btn1_press = UserButtonPress(platform.request("key", 1))
        self.submodules += btn0_press, btn1_press

        # Binary Coded Decimal: convert ss/mm/hh to decimal values
        bcd_seconds = BCD()
        bcd_minutes = BCD()
        bcd_hours   = BCD()
        self.submodules += bcd_seconds, bcd_minutes, bcd_hours
        # use the generated verilog file
        # platform.add_source("bcd.v")

        # combinatorial assignement
        self.comb += [
            # Connect tick to core (core timebase)
            core.tick.eq(tick.ce),

            # Set minutes/hours
            core.inc_minutes.eq(btn0_press.rising),
            core.inc_hours.eq(btn1_press.rising),

            # Convert core seconds to bcd and connect
            # to display
            bcd_seconds.value.eq(core.seconds),
            display.values[0].eq(bcd_seconds.ones),
            display.values[1].eq(bcd_seconds.tens),

            # Convert core minutes to bcd and connect
            # to display
            bcd_minutes.value.eq(core.minutes),
            display.values[2].eq(bcd_minutes.ones),
            display.values[3].eq(bcd_minutes.tens),

            # Convert core hours to bcd and connect
            # to display
            bcd_hours.value.eq(core.hours),
            display.values[4].eq(bcd_hours.ones),
            display.values[5].eq(bcd_hours.tens),

            # Connect display to pads
            # platform.request("display_cs_n").eq(~display.cs),
            # platform.request("display_abcdefg").eq(~display.abcdefg)
        ]

        for i in range(6):
            self.comb += platform.request("seven_seg", i).eq(~display.abcdefg[i])

module = Clock()

# Build --------------------------------------------------------------------------------------------

platform.build(module)
