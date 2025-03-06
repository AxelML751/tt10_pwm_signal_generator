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
// Description: Register of N-bit (configurable).	
//
//	Inputs:
//		clk 	: Clock signal.
//		rst	: Reset signal (active high).
//		ena	: Enable signal (active high).
//		D 		: Input data (N-bit).
//
//	Outputs:
//		Q		: Output data (N-bit).
//


module register_Nbits #(parameter N = 7) (
    input clk, rst, ena,
    input [N-1:0] D,
    output[N-1:0] Q
);

	reg[N-1:0] Qn = 0;
	
	assign Q = Qn;
	
    always @(posedge clk) begin
        if (rst)
            Qn <= 0;
        else if(ena)
            Qn <= D;
    end
	
endmodule