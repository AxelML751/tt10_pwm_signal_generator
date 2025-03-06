// UNIVERSIDAD TECNOLOGICA DE PUEBLA
// Division of Mechatronics Engineering
// Puebla, Mexico.
//
// Described by:
//		Lopez Cespedes, Diego
//		Munoz Leon, Axel Raul
// 	Gomez Jimenez, Jonathan
//
//	Supervised by:
//		Morales Perez, Carlos Javier
//
//	Date: March 2025
//
//
// Description: Module for duty cycle control of PWM signal in pwm_generator module.
//
//	Inputs:
//		clk 	: Clock signal.
//		rst	: Reset signal (active high).
//		ena	: Enable signal (active high).
//		xu		: Up signal (active high).
//		xd		: Down signal (active high).
//
//	Outputs:
//		Npwm	: Value of duty cycle 0-100 (7 bits).
//


module ctrl_pwm (
	input clk, rst, ena,
	input xd, xu,
	output [6:0] Npwm	
	);
	
	wire[1:0] sel;		// <---
	wire[6:0] d, x;	// <---
	
	
	fsm_ctrl		A0(.clk(clk), .rst(rst), .ena(ena), .xd(xd), .xu(xu), .Y(Npwm), .Sel(sel));
	
	mux_ctrl		A1(.a(7'b0000000), .b(7'b0001010), .c(7'b1110110), .sel(sel), .y(x));
	
	adder_Nbits #(.N(7)) A2(.a(Npwm), .b(x), .sum(d));
	
	register_Nbits	#(.N(7)) A3(.clk(clk), .rst(rst), .ena(ena), .D(d), .Q(Npwm));
			
	
endmodule