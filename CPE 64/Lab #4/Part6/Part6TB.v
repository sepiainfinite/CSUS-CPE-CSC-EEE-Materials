module Part6TB();
	reg clock, i, reset;
	wire q0,q1,q2,q3,q4,q5,q6,q7;
	
	Part6 uut(.clock(clock), .i(i), .reset(reset), .q0(q0), .q1(q1), .q2(q2), .q3(q3), .q4(q4), .q5(q5), .q6(q6), .q7(q7));
	
	initial begin 
	clock = 1'b0;
	forever #5 clock = ~clock;
	end
	
	initial begin
	reset = 1'b0;
	#20;
	i = 1'b1;
	#20;
	reset = 1'b1;
	#20;
	end 

	
	initial begin 
	#500;
	$stop;
	
	end
endmodule
