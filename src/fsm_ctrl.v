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
// Description: It is a finite state machine controlling
//					increments/decrements in the ctrl_pwm principal module.	
//
//	Inputs:
//		clk 	: Clock signal.
//		rst	: Reset signal (active high).
//		ena	: Enable signal (active high).
//		xu		: Up signal (active high).
//		xd		: Down signal (active high).
//
//	Outputs:
//		Sel	: Output data (2-bit).
//


module fsm_ctrl(
    input       clk, rst, ena,
                xd, xu,
    input [6:0] Y,
    output reg [1:0] Sel
);

    wire [1:0] xdxu;
    
    reg [2:0] State_p = 7'd0, State_f;

    assign xdxu = {xd, xu};  
    
    always @(State_p or xdxu or Y) begin : FSM
       
        case (State_p)
            3'd0: begin 		// S0
                if (xdxu == 2'b01) State_f = 3'd1; 
                else if (xdxu == 2'b10) State_f = 3'd4; 
                else State_f = 3'd0; 
                Sel = 2'b00;  
            end
            3'd1: begin			// S1
               if (Y == 7'd100) State_f = 3'd3;  
                else State_f = 3'd2; 
                Sel = 2'b00;
            end
            3'd2: begin			// S2 
                State_f = 3'd3; 
                Sel = 2'b01; 
            end
            3'd3: begin			// S3
                if (xdxu == 2'b00) State_f = 3'd0; 
                else State_f = 3'd3; 
                Sel = 2'b00; 
            end
            3'd4: begin			// S4
                if (Y == 7'd0) State_f = 3'd6; 
                else State_f = 3'd5; 
                Sel = 2'b00; 
            end
            3'd5: begin			// S5
                State_f = 3'd6; 
                Sel = 2'b10; 
            end
            default : begin	// S6
                if (xdxu == 2'b00) State_f = 3'd0; 
                else State_f = 3'd6; 
                Sel = 2'b00; 
				end
        endcase
    end
    
    always @(posedge clk) begin : FF
        if (rst)
            State_p <= 3'd0;
        else if (ena)
            State_p <= State_f;
    end
    
endmodule