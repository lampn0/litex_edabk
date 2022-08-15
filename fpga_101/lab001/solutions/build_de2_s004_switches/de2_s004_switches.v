// -----------------------------------------------------------------------------
// Auto-Generated by:        __   _ __      _  __
//                          / /  (_) /____ | |/_/
//                         / /__/ / __/ -_)>  <
//                        /____/_/\__/\__/_/|_|
//                     Build your hardware, easily!
//                   https://github.com/enjoy-digital/litex
//
// Filename   : de2_s004_switches.v
// Device     : EP4CE115F29C7
// LiteX sha1 : a4cc859d
// Date       : 2022-05-18 08:45:44
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Module
//------------------------------------------------------------------------------

module de2_s004_switches (
	output wire user_led0,
	input  wire user_sw0,
	output wire user_led1,
	input  wire user_sw1,
	output wire user_led2,
	input  wire user_sw2,
	output wire user_led3,
	input  wire user_sw3,
	output wire user_led4,
	input  wire user_sw4,
	output wire user_led5,
	input  wire user_sw5,
	output wire user_led6,
	input  wire user_sw6,
	output wire user_led7,
	input  wire user_sw7,
	output wire user_led8,
	input  wire user_sw8,
	output wire user_led9,
	input  wire user_sw9,
	output wire user_led10,
	input  wire user_sw10,
	output wire user_led11,
	input  wire user_sw11,
	output wire user_led12,
	input  wire user_sw12,
	output wire user_led13,
	input  wire user_sw13,
	output wire user_led14,
	input  wire user_sw14,
	output wire user_led15,
	input  wire user_sw15,
	output wire user_led16,
	input  wire user_sw16,
	output wire user_led17,
	input  wire user_sw17,
	input  wire clk50
);


//------------------------------------------------------------------------------
// Signals
//------------------------------------------------------------------------------

wire sys_clk;
wire sys_rst;
wire por_clk;
reg  int_rst = 1'd1;

//------------------------------------------------------------------------------
// Combinatorial Logic
//------------------------------------------------------------------------------

assign user_led0 = (~user_sw0);
assign user_led1 = (~user_sw1);
assign user_led2 = (~user_sw2);
assign user_led3 = (~user_sw3);
assign user_led4 = (~user_sw4);
assign user_led5 = (~user_sw5);
assign user_led6 = (~user_sw6);
assign user_led7 = (~user_sw7);
assign user_led8 = (~user_sw8);
assign user_led9 = user_sw9;
assign user_led10 = user_sw10;
assign user_led11 = user_sw11;
assign user_led12 = user_sw12;
assign user_led13 = user_sw13;
assign user_led14 = user_sw14;
assign user_led15 = user_sw15;
assign user_led16 = user_sw16;
assign user_led17 = user_sw17;
assign sys_clk = clk50;
assign por_clk = clk50;
assign sys_rst = int_rst;


//------------------------------------------------------------------------------
// Synchronous Logic
//------------------------------------------------------------------------------

always @(posedge por_clk) begin
	int_rst <= 1'd0;
end

always @(posedge sys_clk) begin
	if (sys_rst) begin
	end
end


//------------------------------------------------------------------------------
// Specialized Logic
//------------------------------------------------------------------------------

endmodule

// -----------------------------------------------------------------------------
//  Auto-Generated by LiteX on 2022-05-18 08:45:44.
//------------------------------------------------------------------------------
