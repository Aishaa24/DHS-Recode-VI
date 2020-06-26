******************************
*** Child vaccination ********
******************************   

*c_measles	child			Child received measles1/MMR1 vaccination
		gen c_measles  =. 
		replace c_measles = 1 if (h9 ==1 | h9 ==2 | h9 ==3)  
     	replace c_measles = 0 if h9 ==0  
		replace c_measles = . if h9 ==8 | h9 ==9  
	
*c_dpt1	child	Child received DPT1/Pentavalent 1 vaccination	
        gen c_dpt1  = . 
		replace c_dpt1  = 1 if (h3 ==1 | h3 ==2 | h3 ==3)  
		replace c_dpt1  = 0 if h3 ==0  
		*replace c_dpt1  = . if (h3 ==8 | h3 ==9)
		
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

if inlist(name,"Benin2011"){
*c_dpt1	child	Child received DPT1/Pentavalent 1 vaccination	
        drop c_dpt1
		gen c_dpt1 = .
		replace c_dpt1 = 1 if (h3==1 | h3==2 | h3==3|inrange(spev1,1,3)) 
		replace c_dpt1 = 0 if h3==0 & spev1==0 

*c_dpt2	child			Child received DPT2/Pentavalent2 vaccination	
        drop c_dpt2		
		gen c_dpt2 = .
		replace c_dpt2 = 1 if (h5==1 | h5==2 | h5==3|inrange(spev2,1,3)) 
		replace c_dpt2 = 0 if h5==0 & spev2==0 
		
		drop c_dpt3
		gen c_dpt3 = .
		replace c_dpt3 = 1 if (h7==1 | h7==2 | h7==3|inrange(spev3,1,3)) 
		replace c_dpt3 = 0 if h7==0 & spev3==0 
                    }					
									
if inlist(name,"Congorep2011"){
*c_dpt1	child	Child received DPT1/Pentavalent 1 vaccination	
        drop c_dpt1
		gen c_dpt1 = .
		replace c_dpt1 = 1 if (h3==1 | h3==2 | h3==3|inrange(s506t1,1,3)) 
		replace c_dpt1 = 0 if h3==0 & s506t1==0 

*c_dpt2	child			Child received DPT2/Pentavalent2 vaccination	
        drop c_dpt2		
		gen c_dpt2 = .
		replace c_dpt2 = 1 if (h5==1 | h5==2 | h5==3|inrange(s506t2,1,3)) 
		replace c_dpt2 = 0 if h5==0 & s506t2==0 
		
		drop c_dpt3
		gen c_dpt3 = .
		replace c_dpt3 = 1 if (h7==1 | h7==2 | h7==3|inrange(s506t3,1,3)) 
		replace c_dpt3 = 0 if h7==0 & s506t3==0 
                    }							
	
if inlist(name,"Egypt2014") {
        drop c_dpt1
		gen c_dpt1 = .
		replace c_dpt1 = 1 if (h3==1 | h3==2 | h3==3|inrange(spvt1,1,3)) 
		replace c_dpt1 = 0 if h3==0 & spvt1==0 
		
        drop c_dpt2		
		gen c_dpt2 = .
		replace c_dpt2 = 1 if (h5==1 | h5==2 | h5==3|inrange(spvt2,1,3)) 
		replace c_dpt2 = 0 if h5==0 & spvt2==0 
		
		drop c_dpt3
		gen c_dpt3 = .
		replace c_dpt3 = 1 if (h7==1 | h7==2 | h7==3|inrange(spvt3,1,3)) 
		replace c_dpt3 = 0 if h7==0 & spvt3==0 
		}	

		if inlist(name,"Gabon2012"){
*c_dpt1	child	Child received DPT1/Pentavalent 1 vaccination	
        drop c_dpt1
		gen c_dpt1 = .
		replace c_dpt1 = 1 if (h3==1 | h3==2 | h3==3|inrange(s506e1,1,3)) 
		replace c_dpt1 = 0 if h3==0 & s506e1==0 

*c_dpt2	child			Child received DPT2/Pentavalent2 vaccination	
        drop c_dpt2		
		gen c_dpt2 = .
		replace c_dpt2 = 1 if (h5==1 | h5==2 | h5==3|inrange(s506e2 ,1,3)) 
		replace c_dpt2 = 0 if h5==0 & s506e2 ==0 
		
		drop c_dpt3
		gen c_dpt3 = .
		replace c_dpt3 = 1 if (h7==1 | h7==2 | h7==3|inrange(s506e3,1,3)) 
		replace c_dpt3 = 0 if h7==0 & s506e3 ==0 
                    }	

if inlist(name,"DominicanRepublic2013"){
*c_dpt1	child	Child received DPT1/Pentavalent 1 vaccination	
        drop c_dpt1
		gen c_dpt1 = .
		replace c_dpt1 = 1 if (h3==1 | h3==2 | h3==3 |inrange(pt1,1,3)) 
		replace c_dpt1 = 0 if h3==0 & pt1 ==0 

*c_dpt2	child			Child received DPT2/Pentavalent2 vaccination	
        drop c_dpt2		
		gen c_dpt2 = .
		replace c_dpt2 = 1 if (h5==1 | h3==2 | h5==3|inrange(pt2,1,3)) 
		replace c_dpt2 = 0 if h5==0 & pt2==0 
		
		drop c_dpt3
		gen c_dpt3 = .
		replace c_dpt3 = 1 if (h7==1 | h3==2 | h7==3|inrange(pt3,1,3)) 
		replace c_dpt3 = 0 if h7==0 & pt3==0 
                    }	
					
if inlist(name,"Mali2012"){
*c_dpt1	child	Child received DPT1/Pentavalent 1 vaccination	
        drop c_dpt1
		gen c_dpt1 = .
		replace c_dpt1 = 1 if (h3==1 | h3==2 | h3==3 |inrange(vacp1,1,3)) 
		replace c_dpt1 = 0 if h3==0 & vacp1 ==0 

*c_dpt2	child			Child received DPT2/Pentavalent2 vaccination	
        drop c_dpt2		
		gen c_dpt2 = .
		replace c_dpt2 = 1 if (h5==1 | h3==2 | h5==3|inrange(vacp2,1,3)) 
		replace c_dpt2 = 0 if h5==0 & vacp2==0 
		
		drop c_dpt3
		gen c_dpt3 = .
		replace c_dpt3 = 1 if (h7==1 | h3==2 | h7==3|inrange(vacp3,1,3)) 
		replace c_dpt3 = 0 if h7==0 & vacp3==0 
                    }	

		if inlist(name,"Rwanda2010"){
*c_dpt1	child	Child received DPT1/Pentavalent 1 vaccination	
        drop c_dpt1
		gen c_dpt1 = .
		replace c_dpt1 = 1 if (h3==1 | h3==2 | h3==3 |inrange(s506p1,1,3)) 
		replace c_dpt1 = 0 if h3==0 & s506p1 ==0 

*c_dpt2	child			Child received DPT2/Pentavalent2 vaccination	
        drop c_dpt2		
		gen c_dpt2 = .
		replace c_dpt2 = 1 if (h5==1 | h3==2 | h5==3|inrange(s506p2,1,3)) 
		replace c_dpt2 = 0 if h5==0 & s506p2==0 
		
		drop c_dpt3
		gen c_dpt3 = .
		replace c_dpt3 = 1 if (h7==1 | h3==2 | h7==3|inrange(s506p3,1,3)) 
		replace c_dpt3 = 0 if h7==0 & s506p3==0 
                    }
	
		if inlist(name,"Tajikistan2012"){
*c_dpt1	child	Child received DPT1/Pentavalent 1 vaccination	
        drop c_dpt1
		gen c_dpt1 = .
		replace c_dpt1 = 1 if (h3==1 | h3==2 | h3==3 |inrange(svt1,1,3)) 
		replace c_dpt1 = 0 if h3==0 & svt1 ==0 

*c_dpt2	child			Child received DPT2/Pentavalent2 vaccination	
        drop c_dpt2		
		gen c_dpt2 = .
		replace c_dpt2 = 1 if (h5==1 | h3==2 | h5==3|inrange(svt2,1,3)) 
		replace c_dpt2 = 0 if h5==0 & svt2==0 
		
		drop c_dpt3
		gen c_dpt3 = .
		replace c_dpt3 = 1 if (h7==1 | h3==2 | h7==3|inrange(svt3,1,3)) 
		replace c_dpt3 = 0 if h7==0 & svt3==0 
                    }
				
												
*c_bcg	child			Child received BCG vaccination
		gen c_bcg  = . 
		replace c_bcg  = 1 if (h2 ==1 | h2 ==2 | h2 ==3)  
		replace c_bcg  = 0 if h2 ==0  
		replace c_bcg   = . if (h2 ==8 | h2 ==9)

		gen c_polio0  = .  
		replace c_polio0  = 1 if (h0 ==1 | h0 ==2 | h0 ==3)  
		replace c_polio0  = 0 if h0 ==0  
		
*c_polio1	child			Child received polio1/OPV1 vaccination
		gen c_polio1  = .  
		replace c_polio1  = 1 if (h4 ==1 | h4 ==2 | h4 ==3)  
		replace c_polio1  = 0 if h4 ==0
		
*c_polio2	child			Child received polio2/OPV2 vaccination				
		gen c_polio2  = .  
		replace c_polio2  = 1 if (h6 ==1 | h6 ==2 | h6 ==3)  
		replace c_polio2  = 0 if h6 ==0  
		
*c_polio3	child			Child received polio3/OPV3 vaccination				
		gen c_polio3  = .  
		replace c_polio3  = 1 if (h8 ==1 | h8 ==2 | h8 ==3)  
		replace c_polio3  = 0 if h8 ==0 
		
*c_fullimm	child			Child fully vaccinated						
		gen c_fullimm =.  										/*Note: polio0 is not part of allvacc- see DHS final report*/
		replace c_fullimm =1 if (c_measles==1 & c_dpt1 ==1 & c_dpt2 ==1 & c_dpt3 ==1 & c_bcg ==1 & c_polio1 ==1 & c_polio2 ==1 & c_polio3 ==1)  
		replace c_fullimm =0 if (c_measles==0 | c_dpt1 ==0 | c_dpt2 ==0 | c_dpt3 ==0 | c_bcg ==0 | c_polio1 ==0 | c_polio2 ==0 | c_polio3 ==0)  
		replace c_fullimm =. if b5 ==0  
