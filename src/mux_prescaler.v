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
// Description: Multiplexer 6 to 1 of 1-bit.	
//
//	Inputs:
//		a 		: a input data (1-bit).
//		b 		: b input data (1-bit).
//		c 		: c input data (1-bit).
//		d 		: d input data (1-bit).
//		e 		: e input data (1-bit).
//		f 		: f input data (1-bit).
//		sel	: selector (3-bit).
//
//	Outputs:
//		y		: Output data (1-bit).
//


module mux_prescaler
	(
		input a, b, c, d, e, f,
		input[2:0] sel,	// <---
		output y
	);
	
	reg yr;
	
	assign y = yr;
	
	always @(sel or a or b or c or d or e or f) begin : MUX	// <---
		case(sel)
			3'b000	: yr = a;
			3'b001  : yr = b;
			3'b010  : yr = c;
			3'b011  : yr = d;
			3'b100  : yr = e;
			default	: yr = f;
		 endcase
	 end
	
	
endmodule	