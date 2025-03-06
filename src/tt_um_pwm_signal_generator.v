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
// Description: Generator of PWM signal top module. For further information
//				consult the attached documentation.	
//
//	Inputs:
//		clk 	: Clock signal.
//		rst		: Reset signal (active high).
//		ena		: Enable signal (active high).
//		xu		: Up signal (active high).
//		xd		: Down signal (active high).
//		Conf	: Configuration input of prescaler (3-bit).
//
//	Outputs:
//		pwm		: PWM signal generated.
//


module pwm_signal_generator(	
	input rst, clk, ena,
			xu, xd,
	input [2:0] Conf,
	output pwm
	);
	
	wire h, clk_out;
	wire[6:0] d0;
	
	prescaler_32    	U0(.clk(clk), .conf(Conf), .clk_out(clk_out));
	ctrl_pwm 			U1(.clk(clk_out), .rst(rst), .ena(ena), .xd(xd), .xu(xu), .Npwm(d0));
	pwm_generator_x100	U2(.rst(rst), .ena(ena), .clk(clk_out), .Npwm(d0), .pwm(pwm));
	
	
endmodule