`timescale 1ns / 1ps

module Traffic_Light_Controller_test ();
	reg clock;
	reg reset;
	wire red;
	wire green;
	wire yellow;
	
	Traffic_Light_Controller dut (
		.clock (clock),
		.reset (reset),
		.red (red),
		.green (green),
		.yellow (yellow)
	);
	
	initial begin
		clock = 1'b0;
		forever #1 clock = ~clock;
	end
	
	initial begin
		reset = 1'b0;
		#15
		reset = 1'b1;
		#1
		reset = 1'b0;
	end
	
	initial begin
		$monitor("t=%0t | red=%b green=%b yellow=%b", $time, red, green, yellow);
	end

	
endmodule 