
module ff_d_ #(parameter N = 7) (
		input clk, rst, ena,
		input [N-1:0] d,
		output[N-1:0] q
	);

	reg[N-1:0] qn;
	
	assign q = qn;
	
    always @(posedge clk) begin
        if (rst)
            qn <= 0;
        else if(ena)
            qn <= d;
    end
endmodule
