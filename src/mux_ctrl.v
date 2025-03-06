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
// Description: Multiplexer 3 to 1 of 7-bit.	
//
//	Inputs:
//		a 		: A input data (7-bit).
//		b		: B input data (7-bit).
//		c		: C input data (7-bit).
//		sel	: Selector (2-bit).
//
//	Outputs:
//		y		: Output data (7-bit).
//


module mux_ctrl (
    input [6:0] a, b, c, 
    input [1:0] sel,     
    output[6:0] y         
);

    reg[6:0]  yr; 

    assign y = yr; 

    always @(sel or a or b or c) begin : MUX
        case(sel)
            2'b00   : yr = a; 
            2'b01   : yr = b; 
            default : yr = c; 
        endcase
    end

endmodule