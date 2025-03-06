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
// Description: Generator of PWM signal. This module implements a
//					7-bit counter but is limited to the 0-99 range.	
//
//	Inputs:
//		clk 	: Clock signal.
//		rst	: Reset signal (active high).
//		ena	: Enable signal (active high).
//		xu		: Up signal (active high).
//		xd		: Down signal (active high).
//
//	Outputs:
//		pwm	: PWM signal generated.
//


module pwm_generator_x100 (
	input rst, ena, clk,
	input [6:0] Npwm,
	output pwm
);

	wire[6:0] d0;
	wire ex, d1;	// <----
	wire[6:0] d;	// <----
	
	assign d1 = rst | ex;
	
	adder_Nbits		#(.N(7)) U0(.a(d0), .b(7'd1), .sum(d));
	register_Nbits	#(.N(7)) U1(.clk(clk), .rst(d1), .ena(ena), .D(d), .Q(d0));
	comp_equ_Nbits	#(.N(7)) U2(.A(7'd99), .B(d0), .equ(ex));
	comp_lth_Nbits	#(.N(7)) U3(.A(d0), .B(Npwm), .lth(pwm));
	
endmodule
