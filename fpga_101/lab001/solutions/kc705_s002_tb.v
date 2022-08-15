`timescale 1ns/1ns
module kc705_s002_tb ();
reg	clk156_p;
reg clk156_n;
wire user_led;

always #10 clk156_p = ~clk156_p;
always clk156_n = ~clk156_p;

s002_blink s002_blink(
.clk156_p(clk156_p),
.clk156_n(clk156_n),
.user_led(user_led)
	);

initial begin
	clk156_p = 0;
	repeat (100) @(negedge clk156_p);
	$finish;
end

endmodule : kc705_s002_tb