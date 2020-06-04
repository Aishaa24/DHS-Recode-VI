**************************
*** Child illness ********
**************************   
	   	
/* 
Note: for phase 6: V000 = AM6 CG6 KE6, use the old code for formal provider for ARI and Diarrhea.
Because the for the formal provider, the information can not be captured from the variable label, but only 
from the report/survey, which presented in the adeptfile. 
 */


rename *,lower   //make lables all lowercase. 
order *,sequential  //make sure variables are in order. 

*c_diarrhea Child with diarrhea in last 2 weeks
	    gen c_diarrhea=(h11 ==2| h11 ==2) 						/*symptoms in last two weeks*/
		replace c_diarrhea=. if h11   ==8|h11  ==9|h11  ==. 
					 
		gen ccough=(h31  ==1|h31  ==2) 
		replace ccough=. if h31  ==8|h31  ==9|h31  ==. 
					  
*c_treatdiarrhea Child with diarrhea receive oral rehydration salts (ORS)
		cap gen h13b  =. 
		gen c_treatdiarrhea=(h13  ==1|h13  ==2|h13b  ==1) 	if c_diarrhea == 1							/*ORS for diarrhea*/
		replace c_treatdiarrhea=. if (h13  ==8|h13  ==9 | h13  ==.)&(h13b  ==8|h13b  ==9 | h13b  ==.) 
		
*c_diarrhea_hmf	Child with diarrhea received recommended home-made fluids
        gen c_diarrhea_hmf=(h14 ==1 | h14  ==2) if c_diarrhea == 1			/* home made fluid for diarrhea*/
		replace c_diarrhea_hmf=. if h14  ==8| h14  ==9 | h14  ==. 
	
*c_diarrhea_pro	The treatment was provided by a formal provider (all public provider except other public, pharmacy, and private sector)

	gen c_diarrhea_pro = 0 if c_diarrhea == 1
		
		if inlist(name,"Armenia2010") {
			global h12 "h12a h12b h12c h12d h12e h12f h12g h12j h12l h12m h12n h12o h12p h12r h12z"
		}
			
		foreach var in $h12  {
			replace c_diarrhea_pro = 1 if c_diarrhea_pro == 0 & `var' == 1 
			replace c_diarrhea_pro = . if `var' == 8 
		}
		
		if inlist(name,"Bangladesh2011") {
			global h12 "h12a h12b h12c h12d h12e h12f h12g h12h h12j h12l  h12n h12o h12s h12t  h12r h12z"
		}
			
		foreach var in $h12  {
			replace c_diarrhea_pro = 1 if c_diarrhea_pro == 0 & `var' == 1 
			replace c_diarrhea_pro = . if `var' == 8 
		}		
		
		if inlist(name,"Bangladesh2014") {
			global h12 "h12a h12b h12c h12d h12e h12f h12g h12j h12l  h12n h12o h12s h12t h12u h12z"
		}
			
		foreach var in $h12  {
			replace c_diarrhea_pro = 1 if c_diarrhea_pro == 0 & `var' == 1 
			replace c_diarrhea_pro = . if `var' == 8 
		}
		
		if inlist(name,"Benin2011") {
			global h12 "h12a h12b h12c h12d h12e h12f h12g h12j h12l h12m h12n h12o h12z"
		}
			
		foreach var in $h12  {
			replace c_diarrhea_pro = 1 if c_diarrhea_pro == 0 & `var' == 1 
			replace c_diarrhea_pro = . if `var' == 8 
		}		
			
		
		if inlist(name,"BurkinaFaso2010") {
			global h12 "h12a h12b h12c h12d h12j h12l h12m h12s h12z"
		}
			
		foreach var in $h12  {
			replace c_diarrhea_pro = 1 if c_diarrhea_pro == 0 & `var' == 1 
			replace c_diarrhea_pro = . if `var' == 8 
		}	
		
			if inlist(name,"Burundi2010") {
			global h12 "h12a h12b h12c h12d h12j h12l h12m  h12n h12z"
		}
			
		foreach var in $h12  {
			replace c_diarrhea_pro = 1 if c_diarrhea_pro == 0 & `var' == 1 
			replace c_diarrhea_pro = . if `var' == 8 
		}	
		
		
		if inlist(name,"Cambodia2014") {
			global h12 "h12a h12b h12c h12d h12f h12g h12h h12j h12o h12p h12q h12z"
		}
			
		foreach var in $h12  {
			replace c_diarrhea_pro = 1 if c_diarrhea_pro == 0 & `var' == 1 
			replace c_diarrhea_pro = . if `var' == 8 
		}	
		
		if inlist(name,"Cameroon2011") {
			global h12 "h12a h12b h12c h12j h12m h12n h12o h12u h12w h12z"
		}
			
		foreach var in $h12  {
			replace c_diarrhea_pro = 1 if c_diarrhea_pro == 0 & `var' == 1 
			replace c_diarrhea_pro = . if `var' == 8 
		}	
		
		if inlist(name,"Chad2014") {
		   global h12 "h12a h12b h12c h12d h12j h12m h12n h12o h12p h12r h12z"
		}
		
		if inlist(name,"Comoros2012") {
		   global h12 "h12a h12b h12c h12d h12e h12f h12j h12l h12z"
		}
		
		if inlist(name,"Congorep2011") {
		   global h12 "h12a h12b h12c h12j h12l h12m h12z"
		}
		
				
		if inlist(name,"Congodr2013") {
		   global h12 "h12a h12b h12c h12d h12e h12f h12g h12j h12l h12m h12z"
		}
		
		foreach var in $h12  {
			replace c_diarrhea_pro = 1 if c_diarrhea_pro == 0 & `var' == 1 
			replace c_diarrhea_pro = . if `var' == 8 
		}	
		
*c_diarrhea_mof	Child with diarrhea received more fluids
        gen c_diarrhea_mof = (h38 == 5) if !inlist(h38,.,8) & c_diarrhea == 1

*c_diarrhea_medfor Get formal medicine except (ors hmf home other_med, country specific). 
        egen medfor = rowtotal(h12z h15 h15a h15b h15c h15e h15g h15h h15i),mi
		gen c_diarrhea_medfor = ( medfor > = 1 ) if c_diarrhea == 1
		// formal medicine don't include "home remedy, herbal medicine and other"
        replace c_diarrhea_medfor = . if (h12z == 8 | h15 == 8 | h15a == 8 | h15b == 8 | h15c == 8 | h15e == 8  | h15g == 8 | h15h == 8 | h15i == 8 )                                       
*c_diarrhea_med	Child with diarrhea received any medicine other than ORS or hmf (country specific)
        egen med = rowtotal(h12z h15 h15a h15b h15c h15d h15e h15f h15g h15h h15i),mi
        gen c_diarrhea_med = ( med > = 1 ) if c_diarrhea == 1
        replace c_diarrhea_med = . if (h12z == 8 | h15 == 8 | h15a == 8 | h15b == 8 | h15c == 8 | h15d == 8 | h15e == 8 | h15f == 8 | h15g == 8 | h15h == 8 | h15i == 8 )
		
*c_diarrheaact	Child with diarrhea seen by provider OR given any form of formal treatment
        gen c_diarrheaact = (c_diarrhea_pro==1 | c_diarrhea_medfor==1 | c_diarrhea_hmf==1 | c_treatdiarrhea==1) if c_diarrhea == 1
		replace c_diarrheaact = . if (c_diarrhea_pro == . | c_diarrhea_medfor == . | c_diarrhea_hmf == . | c_treatdiarrhea == .) & c_diarrhea == 1		
					 					
*c_diarrheaact_q	Child with diarrhea who received any treatment or consultation and received ORS
        gen c_diarrheaact_q = c_treatdiarrhea  if c_diarrheaact == 1
        replace c_diarrheaact_q = . if  c_treatdiarrhea == .
		
*c_fever	Child with a fever in last two weeks
        gen c_fever = (h22 == 1) if !inlist(h22,.,8,9)
		
*c_sevdiarrhea	Child with severe diarrhea
		gen eat = (inlist(h39,0,1,2)) if !inlist(h39,.,8) & c_diarrhea == 1
        gen c_sevdiarrhea = (c_diarrhea==1 & (c_fever == 1 | c_diarrhea_mof == 1 | eat == 1)) 
		replace c_sevdiarrhea = . if c_diarrhea == . | c_fever == . | (c_diarrhea == 1 & (c_diarrhea_mof ==.| eat==.))
		/* diarrhea in last 2 weeks AND any of the following three conditions: fever OR offered 
		more than usual to drink OR given much less or nothing to eat or stopped eating */
		// change this becase the sample sizes of c_diarrhea_mof and eat are restricted to c_diarrhea = 1.
		
*c_sevdiarrheatreat	Child with severe diarrhea seen by formal healthcare provider
        gen c_sevdiarrheatreat = (c_sevdiarrhea == 1 & c_diarrhea_pro == 1) if c_diarrhea == 1
		replace c_sevdiarrheatreat = . if c_sevdiarrhea == . | c_diarrhea_pro == .
		
*c_sevdiarrheatreat_q	IV (intravenous) treatment of severe diarrhea among children with any formal provider visits
        gen iv = (h15c == 1) if !inlist(h15,.,8) & c_diarrhea == 1
		gen c_sevdiarrheatreat_q = (iv ==1 ) if c_sevdiarrheatreat == 1
		
*c_ari	Child with acute respiratory infection (ARI)	
        recode h31b h31c h31 (8 9 =.)
		gen c_ari = (inlist(h31c,1,3) & ccough == 1 & h31b == 1) 
		replace c_ari=. if h31b == . | ccough == .
		/* Children under 5 with cough and rapid breathing in the 
		two weeks preceding the survey which originated from the chest. */
		
		gen c_ari2 = . 
		replace c_ari2 = 1 if h31b == 1
		replace c_ari2 = 0 if h31b == 0 | ccough == 0
		/* Children under 5 with cough and rapid breathing in the 
		two weeks preceding the survey. */
		
*c_treatARI/c_treatARI2	   Child with acute respiratory infection (ARI) /ARI2 symptoms seen by formal provider

		gen c_treatARI= 0 if c_ari == 1
		gen c_treatARI2= 0 if c_ari2 == 1
		
		if inlist(name,"Armenia2010") {
		   global h32 "h32a h32b h32c h32d h32e h32f h32g h32j h32l  h32m  h32n h32o h32p h32q h32z"
		}	
		
		if inlist(name,"Bangladesh2011") {
			global h32 "h32a h32b h32c h32d h32e h32f h32g h32h h32j h32l h32o h32s h32o h32z"
		}
		
		if inlist(name,"Bangladesh2014") {
			global h32 "h32b h32c h32d h32e h32f h32g h32h h32j h32l h32o h32s h32o h32z"
		}	
		
		if inlist(name,"BurkinaFaso2010") {
		global h32 " h32a h32b h32c h32d h32j h32l h32m h32s h32z"
		}
		
		if inlist(name,"Burundi2010") {
		global h32 " h32a h32b h32c h32d h32j h32l h32m h32n h32z"
		}	
		
		if inlist(name,"Cambodia2014") {
		global h32 " h32a h32b h32c h32d h32f h32g h32h h32j h32o h32p h32q h32z"
		}
		
		if inlist(name,"Cameroon2011") {
		global h32 " h32a h32b h32c h32j h32m h32n h32o h32u h32w h32z"
		}
	
		if inlist(name,"Chad2014") {
		global h32 " h32a h32b h32c h32d h32j h32m h32n h32o h32p h32r  h32z"
		}
	
		if inlist(name,"Comoros2012") {
		global h32 " h32a h32b h32c h32d h32e h32f h32j h32l h32z"
		}
		
		if inlist(name,"Congorep2011") {
		global h32 " h32a h32b h32c h32l h32m h32z"
		}
		
				
		if inlist(name,"Congodr2013") {
		global h32 " h32a h32b h32c h32d h32e h32f h32g h32j h32l h32m h32z"
		}
			
		foreach var in $h32 {
			replace c_treatARI = 1 if c_treatARI == 0 & `var' == 1 
			replace c_treatARI = . if `var' == 8 | c_ari != 1
			
			replace c_treatARI2 = 1 if c_treatARI2 == 0 & `var' == 1 
			replace c_treatARI2 = . if `var' == 8 | c_ari2 != 1	
		}	
	
*c_fevertreat	Child with fever symptoms seen by formal provider			      
          
	    gen c_fevertreat = 0 if c_fever == 1
		foreach var in $h32 {
		replace c_fevertreat = 1 if c_fevertreat == 0 & `var' == 1
		replace c_fevertreat = . if `var' == 9 
		}
		
*c_illness	Child with any illness symptoms in last two weeks
   		gen c_illness = (c_diarrhea == 1 | c_ari == 1 | c_fever == 1) 
		replace c_illness =. if c_diarrhea == . | c_ari == . | c_fever == .
		
		gen c_illness2 = (c_diarrhea == 1 | c_ari2 == 1 | c_fever == 1) 
		replace c_illness2 =. if c_diarrhea == . | c_ari2 == . | c_fever == .
		
*c_illtreat	Child with any illness symptoms taken to formal provider
        gen c_illtreat = (c_fevertreat == 1 | c_diarrhea_pro == 1 | c_treatARI == 1) if c_illness == 1 
		replace c_illtreat = . if (c_fever == 1 & c_fevertreat == .) | (c_diarrhea == 1 & c_diarrhea_pro == .) | (c_ari == 1 & c_treatARI == .) 

         gen c_illtreat2 = (c_fevertreat == 1 | c_diarrhea_pro == 1 | c_treatARI2 == 1) if c_illness2 == 1
		replace c_illtreat2 = . if (c_fever == 1 & c_fevertreat == .) | (c_diarrhea == 1 & c_diarrhea_pro == .) | (c_ari2 == 1 & c_treatARI2 == .) 

