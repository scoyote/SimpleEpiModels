/********************************************************************************************/ 
/***** Methods from Numberphile Video and Geogebra-Sam Croker samuel.croker@gmail.com		*/
/***** Geogebra Notebook: 	https://www.geogebra.org/m/aqpv5df7								*/
/***** Numberphile:			https://www.youtube.com/watch?v=k6nLfCbAzgo						*/
/********************************************************************************************/ 
DATA d_scaffold; 
	DO time = 1 TO 20; 
		OUTPUT; 
	END; 
RUN;

PROC MODEL data=d_scaffold plots=all outmodel=sir; 
	parameters	
		transm 1.9
		recov  0.18
	;
	dependent S_T  0.99
			  R_T  0
			  I_T  0.01
	;
	DERT.S_T = -transm * S_T * I_T;
	DERT.I_T = transm * S_T * I_T - recov * I_T;
	DERT.R_T = recov * I_T;	
	       
	SOLVE S_T  I_T  R_T    / out=SIR_SOLVE ; 	
RUN;QUIT;


ods html close;ods rtf close;ods pdf close;ods document close; 
ods graphics / reset width=7in height=5in imagemap imagename="SIRModel"  outputfmt=png;	
	proc sgplot data=sir_solve;
		series x=time y=S_T / lineattrs=(color="blue") smoothconnect;
		series x=time y=I_T / lineattrs=(color="red") smoothconnect;
		series x=time y=R_T / lineattrs=(color="green") smoothconnect;
	run;
ods graphics / reset;

