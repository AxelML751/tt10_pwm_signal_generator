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
// Description: Comparator A < B of N-bit (configurable).	
//
//	Inputs:
//		A 		: A input data (N-bit).
//		B		: B input data (N-bit).
//
//	Outputs:
//		lth	: Results of comparation (N-bit).
//


module comp_lth_Nbits #(parameter N = 7) (
	    input  [N-1:0] A,     
	    input  [N-1:0] B,     
	    output lth
	);

    assign lth = (A < B) ? 1'b1 : 1'b0;   // <---

endmodule