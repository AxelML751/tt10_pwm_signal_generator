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
// Description: T-type flip-flop.
//
//	Inputs:
//		clk 	: Clock signal.
//		t		: input data (1-bit).
//
//	Outputs:
//		q		: output data (1-bit).
//


module ff_t (
		 input  clk,
		 input  t,      
		 output q       
	);
	
	reg qn = 0;
	
	assign q = qn;

	always @(posedge clk) begin
		 qn <= qn ^ t;       
	end

endmodule