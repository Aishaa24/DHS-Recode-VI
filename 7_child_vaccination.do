******************************
*** Child vaccination ********
******************************   

*c_measles	child			Child received measles1/MMR1 vaccination
       *gen c_measles  =. 
	   *replace c_measles = 1 if (h9 ==1 | h9 ==2) 
       *replace c_measles = 0 if h9 ==0 
	   
	   gen c_measles  =.
	   replace c_measles = 1 if (h9 ==1 | h9 ==2 | h9 ==3)
	   replace c_measles = 0 if  h9 ==0
	   replace c_measles = . if (h9 ==8 | h9 ==9)
	
*c_dpt1	child	Child received DPT1/Pentavalent 1 vaccination	
        gen c_dpt1  = . 
		replace c_dpt1  = 1 if (h3 ==1 | h3 ==2 | h3 ==3)  
		replace c_dpt1  = 0 if h3 ==0  
		replace c_dpt1  = . if (h3 ==8 | h3 ==9)
		
*c_dpt2	child			Child received DPT2/Pentavalent2 vaccination				
		gen c_dpt2  = . 
		replace c_dpt2  = 1 if (h5 ==1 | h5 ==2 | h5 ==3)  
		replace c_dpt2  = 0 if h5 ==0  
		replace c_dpt2  = . if (h5 ==8 | h5 ==9)
		
*c_dpt3	child			Child received DPT3/Pentavalent3 vaccination				
		gen c_dpt3  = . 
		replace c_dpt3  = 1 if (h7 ==1 | h7 ==2 | h7 ==3)  
		replace c_dpt3  = 0 if h7 ==0  
		replace c_dpt3  = . if (h7 ==8 | h7 ==9)
		
if inlist(name,"Armenia2010"){
*c_dpt1	child	Child received DPT1/Pentavalent 1 vaccination	
        drop c_dpt1
		gen c_dpt1 = .
		replace c_dpt1 = 1 if (h3==1 | h3==2 | h3==3|inrange(pen1,1,3)) 
		replace c_dpt1 = 0 if h3==0 & pen1==0 

*c_dpt2	child			Child received DPT2/Pentavalent2 vaccination	
        drop c_dpt2		
		gen c_dpt2 = .
		replace c_dpt2 = 1 if (h5==1 | h5==2 | h5==3|inrange(pen2,1,3)) 
		replace c_dpt2 = 0 if h5==0 & pen2==0 
		
		drop c_dpt3
		gen c_dpt3 = .
		replace c_dpt3 = 1 if (h7==1 | h7==2 | h7==3|inrange(pen3,1,3)) 
		replace c_dpt3 = 0 if h7==0 & pen3==0 
                    }				
					
*c_bcg	child			Child received BCG vaccination
		gen c_bcg  = . 
		replace c_bcg  = 1 if (h2 ==1 | h2 ==2 | h2 ==3)  
		replace c_bcg  = 0 if h2 ==0  
		replace c_bcg   = . if (h2 ==8 | h2 ==9)

		gen c_polio0  = .  
		replace c_polio0  = 1 if (h0 ==1 | h0 ==2 | h0 ==3)  
		replace c_polio0  = 0 if h0 ==0  
		replace c_polio0   = . if (h0 ==8 | h0 ==9)
		
*c_polio1	child			Child received polio1/OPV1 vaccination
		gen c_polio1  = .  
		replace c_polio1  = 1 if (h4 ==1 | h4 ==2 | h4 ==3)  
		replace c_polio1  = 0 if h4 ==0
		replace c_polio1  = . if (h4 ==8 | h4 ==9)
		
*c_polio2	child			Child received polio2/OPV2 vaccination				
		gen c_polio2  = .  
		replace c_polio2  = 1 if (h6 ==1 | h6 ==2 | h6 ==3)  
		replace c_polio2  = 0 if h6 ==0  
		replace c_polio2  = . if (h6 ==8 | h6 ==9)
		
*c_polio3	child			Child received polio3/OPV3 vaccination				
		gen c_polio3  = .  
		replace c_polio3  = 1 if (h8 ==1 | h8 ==2 | h8 ==3)  
		replace c_polio3  = 0 if h8 ==0 
		replace c_polio3  = . if (h8 ==8 | h8 ==9)
		
*c_fullimm	child			Child fully vaccinated						
		gen c_fullimm =.  										/*Note: polio0 is not part of allvacc- see DHS final report*/
		replace c_fullimm =1 if (c_measles==1 & c_dpt1 ==1 & c_dpt2 ==1 & c_dpt3 ==1 & c_bcg ==1 & c_polio1 ==1 & c_polio2 ==1 & c_polio3 ==1)  
		replace c_fullimm =0 if (c_measles==0 | c_dpt1 ==0 | c_dpt2 ==0 | c_dpt3 ==0 | c_bcg ==0 | c_polio1 ==0 | c_polio2 ==0 | c_polio3 ==0)  
		replace c_fullimm =. if b5 ==0  