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
// Description: D-type flip-flop.
//
//	Inputs:
//		clk 	: Clock signal.
//		d		: input data (1-bit)
//
//	Outputs:
//		q		: output data (1-bit).
//

module ff_d (
		 input  clk,    
		 input  d,      
		 output reg q       
	);

	always @(posedge clk) begin
		 q <= d;     
	end

endmodule

	
	