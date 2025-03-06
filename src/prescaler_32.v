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
// Description: Prescaler module (1:1 to 1:32).
//
//	Inputs:
//		clk 	: Clock signal.
//		Conf	: Configuration of prescaler (3 bits).
//					000 correspond to 1:1
//					001 correspond to 1:2
//					010 correspond to 1:4
//					011 correspond to 1:8
//					100 correspond to 1:16
//					101 correspond to 1:32
//
//	Outputs:
//		clk_out	: Clock signal which frequency is configured by Conf input.
//


module prescaler_32 (
    input clk,
    input [2:0] conf,
    output clk_out
);
	
	wire d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10;
	wire[4:0] H;
	
	
	decod_conf U0(.s(conf), .h(H));
    
	assign d0 = H[0] & ~d1;
	ff_d U1(.clk(clk), .d(d0), .q(d1));
	
	ff_d U2(.clk(clk), .d(d1), .q(d2));
	
	assign d3 = d1 & ~d2 & H[1];
	ff_t U3(.clk(clk), .t(d3), .q(d4));
	
	assign d5 = d4 & d3 & H[2];
	ff_t U4(.clk(clk), .t(d5), .q(d6));
	
	assign d7 = d6 & d5 & H[3];
	ff_t U5(.clk(clk), .t(d7), .q(d8));
	
	assign d9 = d8 & d7 & H[4];
	ff_t U6(.clk(clk), .t(d9), .q(d10));
	
	mux_prescaler U7(.sel(conf), .a(clk), .b(d1), .c(d4), .d(d6), .e(d8), .f(d10), .y(clk_out));
	

endmodule

