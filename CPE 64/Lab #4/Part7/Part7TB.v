`timescale 1ns	/ 1ps
module Part7TB();
	reg clk=1'b0, si=1'b0, pl=1'b1, sl=1'b0, sr=1'b0, rr=1'b0, rl=1'b0;
	wire [7:0] Q;
	integer i,j,k,l,m,n,o;
	
	Part7 uut(.clk(clk), .si(si), .pl(pl), .sl(sl), .sr(sr), .rr(rr), .rl(rl), .Q(Q));
	
	initial begin
	for(i=0;i<160;i=i+1) begin
	#20
	clk<=~clk;
	end
	$stop;
	end
	
	initial begin 
	for(j=0;i<107;j=j+1) begin
	#30;
	si<=~si;
	end
	$stop;
	end 
	
	initial begin 
	for(k=0;k<80;k=k+1) begin
	#40;
	pl<=~pl;
	end
	$stop;
	end 
	
	initial begin 
	for(l=0;l<64;l=l+1) begin
	#50;
	sl<=~sl;
	end
	$stop;
	end 
	
	initial begin 
	for(m=0;m<54;m=m+1) begin
	#60;
	sr<=~sr;
	end
	$stop;
	end 
	
	initial begin 
	for(n=0;n<46;n=n+1) begin
	#70;
	rr<=~rr;
	end
	$stop;
	end 
	
	initial begin 
	for(o=0;o<40;o=o+1) begin
	#80;
	rl<=~rl;
	end
	$stop;
	end 

	endmodule
	