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
// Description: Adder of N-bit (configurable).	
//
//	Inputs:
//		a 		: A input data (N-bit).
//		b		: B input data (N-bit).
//
//	Outputs:
//		sum	: Results of operation A + B (N-bit).
//


module adder_Nbits #(parameter N = 5) (
    input [N-1:0] a,
    input [N-1:0] b,
    output[N-1:0] sum
);

    assign sum = a + b;
	 
endmodule