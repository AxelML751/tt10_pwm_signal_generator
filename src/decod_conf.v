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
// Description: Decode module.
//						s	 |	h
//						-----------
//						000 | 00001
//						001 | 00011
//						010 | 00111
//						011 | 01111
//						100 | 11111
//						101 | 11111
//						110 | 11111
//						111 | 11111		
//
//	Inputs:
//		s 	: Selector (3-bit).
//
//	Outputs:
//		h	: Hold (5-bit).
//


module decod_conf(
	input [2:0] s,
	output[4:0] h
	);
	
	wire[2:0] x;
	
	assign x[0] = s[0] | s[1];
	assign x[1] = s[1] | s[2];
	assign x[2] = s[0] & s[1];
	
	assign h[0] = s[2] | x[0];
	assign h[1] = x[1];
	assign h[2] = s[2] | x[2];
	assign h[3] = s[2];
	assign h[4] = s[2] & x[0];
	
endmodule