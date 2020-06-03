******************************
*** Delivery Care************* 
******************************
gen DHS_phase=substr(v000, 3, 1)
destring DHS_phase, replace

gen country_year="`name'"
gen year = regexs(1) if regexm(country_year, "([0-9][0-9][0-9][0-9])[\-]*[0-9]*[ a-zA-Z]*$")
destring year, replace
gen country = regexs(1) if regexm(country_year, "([a-zA-Z]+)")

rename *,lower   //make lables all lowercase. 
order *,sequential  //make sure variables are in order. 

	*sba_skill: Categories as skilled: doctor, nurse, midwife, auxiliary nurse/midwife...
	
	if inlist(name, "Armenia2010", "Cambodia2014", "Cameroon2011"){
	foreach var of varlist m3a-m3c{
	replace `var' = . if !inlist(`var',0,1)	
	}
	egen sba_skill = rowtotal(m3a m3b m3c),mi
	}
	
	if inlist(name, "Bangladesh2011", "Bangladesh2014", "Comoros2012"){
	foreach var of varlist m3a-m3c{
	replace `var' = . if !inlist(`var',0,1)	
	}
	egen sba_skill = rowtotal(m3a m3b m3c m3d m3e m3f),mi
	}
	
	if inlist(name, "Benin2011", "Burundi2010"){
	foreach var of varlist m3a-m3b{
	replace `var' = . if !inlist(`var',0,1)	
	}
	egen sba_skill = rowtotal(m3a m3b),mi
	}
	
	if inlist(name, "BurkinaFaso2010"){
	foreach var of varlist m3a m3b m3c m3d m3e{
	replace `var' = . if !inlist(`var',0,1)	
	}
	egen sba_skill = rowtotal(m3a m3b m3c m3d m3e),mi
	}
	
	if inlist(name, "Chad2014", "Congorep2011"){
	foreach var of varlist m3a m3b m3c m3d{
	replace `var' = . if !inlist(`var',0,1)	
	}
	egen sba_skill = rowtotal(m3a m3b m3c),mi
	}
	
	if inlist(name, "Congodr2013"){
	foreach var of varlist m3a m3b m3g{
	replace `var' = . if !inlist(`var',0,1)	
	}
	egen sba_skill = rowtotal(m3a m3b m3c),mi
	}
	
	*c_hospdel: child born in hospital of births in last 2 years  
	decode m15, gen(m15_lab)
	replace m15_lab = lower(m15_lab)
	
	gen c_hospdel = 0 if !mi(m15)
	replace c_hospdel = 1 if ///
    regexm(m15_lab,"medical college|surgical") | ///
	regexm(m15_lab,"hospital") & !regexm(m15_lab,"center|sub-center")
	replace c_hospdel = . if mi(m15) | m15 == 99 | mi(m15_lab)	
    // please check this indicator in case it's country specific	
	
	*c_facdel: child born in formal health facility of births in last 2 years
	gen c_facdel = 0 if !mi(m15)
	replace c_facdel = 1 if regexm(m15_lab,"hospital|maternity|health center|dispensary") | ///
	!regexm(m15_lab,"home|other private|other$|pharmacy|non medical|private nurse|religious|abroad|india|other public|tba")
	replace c_facdel = . if mi(m15) | m15 == 99 | mi(m15_lab)

	*c_earlybreast: child breastfed within 1 hours of birth of births in last 2 years
	gen c_earlybreast = .
	
	replace c_earlybreast = 0 if m4 != .    //  based on Last born children who were ever breastfed
	replace c_earlybreast = 1 if inlist(m34,0,100)
	replace c_earlybreast = . if inlist(m34,999,299,199)
	
    *c_skin2skin: child placed on mother's bare skin immediately after birth of births in last 2 years
	
	capture confirm variable m77
	if _rc == 0{
	gen c_skin2skin = (m77 == 1) if !mi(m77)               
	}
	gen c_skin2skin = .

	if inlist(name, "Bangladesh2014"){
	gen c_skin2skin = (s435ai  == 1) if   !inlist(s435ai,.,8) 
	}
	
	*c_sba: Skilled birth attendance of births in last 2 years: go to report to verify how "skilled is defined"
	gen c_sba = . 
	replace c_sba = 1 if sba_skill>=1 
	replace c_sba = 0 if sba_skill==0 
	  
	*c_sba_q: child placed on mother's bare skin and breastfeeding initiated immediately after birth among children with sba of births in last 2 years
	gen c_sba_q = (c_skin2skin == 1 & c_earlybreast == 1) if c_sba == 1
	replace c_sba_q = . if c_skin2skin == . | c_earlybreast == .
	
	*c_caesarean: Last birth in last 2 years delivered through caesarean                    
	clonevar c_caesarean = m17
	replace c_caesarean =. if m17==9
	
    *c_sba_eff1: Effective delivery care (baby delivered in facility, by skilled provider, mother and child stay in facility for min. 24h, breastfeeding initiated in first 1h after birth)
	/*
	if inlist(name, "Armenia2010", "BurkinaFaso2010"){
	gen stay = (inrange(m61,124,198)|inrange(m61,201,298)|inrange(m61,301,398))  
	replace stay = . if mi(m61) | inlist(m61,199,299,998)
	gen c_sba_eff1 = (c_facdel == 1 & c_sba == 1 & stay == 1 & c_earlybreast == 1) 
	replace c_sba_eff1 = . if c_facdel == . | c_sba == . | stay == . | c_earlybreast == . 
	}
	
	if inlist(name, "Bangladesh2011"){
	gen stay = (inrange(m61,201,224)|inrange(m61,301,309))  
	replace stay = . if mi(m61) | inlist(m61,998,999)
	gen c_sba_eff1 = (c_facdel == 1 & c_sba == 1 & stay == 1 & c_earlybreast == 1) 
	replace c_sba_eff1 = . if c_facdel == . | c_sba == . | stay == . | c_earlybreast == . 
	}
	
	if inlist(name, "Bangladesh2014"){
	gen stay = (inlist(m61,124) | inrange(m61,201,224)|inrange(m61,301,308))  
	replace stay = . if mi(m61) | inlist(m61,998)
	gen c_sba_eff1 = (c_facdel == 1 & c_sba == 1 & stay == 1 & c_earlybreast == 1) 
	replace c_sba_eff1 = . if c_facdel == . | c_sba == . | stay == . | c_earlybreast == . 
	}	
	
	if inlist(name, "Benin2011"){
	gen stay = (inrange(m61,124,188) | inrange(m61,201,290)|inrange(m61,301,312))  
	replace stay = . if mi(m61) | inlist(m61,999)
	gen c_sba_eff1 = (c_facdel == 1 & c_sba == 1 & stay == 1 & c_earlybreast == 1) 
	replace c_sba_eff1 = . if c_facdel == . | c_sba == . | stay == . | c_earlybreast == . 
	}
	
	if inlist(name, "Comoros2012"){
	gen stay = (inrange(m61,124,173) | inrange(m61,201,224)|inrange(m61,301,308))  
	replace stay = . if mi(m61) | inlist(m61,999)
	gen c_sba_eff1 = (c_facdel == 1 & c_sba == 1 & stay == 1 & c_earlybreast == 1) 
	replace c_sba_eff1 = . if c_facdel == . | c_sba == . | stay == . | c_earlybreast == . 
	}
	
	if inlist(name, "Congorep2011"){
	gen stay = (inlist(m61,124) | inrange(m61,201,230)|inrange(m61,301,312))  
	replace stay = . if mi(m61) | inlist(m61,998,999)
	gen c_sba_eff1 = (c_facdel == 1 & c_sba == 1 & stay == 1 & c_earlybreast == 1) 
	replace c_sba_eff1 = . if c_facdel == . | c_sba == . | stay == . | c_earlybreast == . 
	}
	
    if inlist(name, "Burundi2010", "Cambodia2014", "Cameroon2011"){
	gen stay=.
	gen c_sba_eff1 =.
	}
	
	if inlist(name, "Chad2014"){
	gen stay = (inrange(m61,124,130) | inrange(m61,201,225)|inrange(m61,301,313))  
	replace stay = . if mi(m61) | inlist(m61,998)
	gen c_sba_eff1 = (c_facdel == 1 & c_sba == 1 & stay == 1 & c_earlybreast == 1) 
	replace c_sba_eff1 = . if c_facdel == . | c_sba == . | stay == . | c_earlybreast == . 
	}
	
	if inlist(name, "Congodr2013"){
	gen stay = (inrange(m61,124,160) | inrange(m61,201,260)|inrange(m61,301,312))  
	replace stay = . if mi(m61) | inlist(m61,998)
	gen c_sba_eff1 = (c_facdel == 1 & c_sba == 1 & stay == 1 & c_earlybreast == 1) 
	replace c_sba_eff1 = . if c_facdel == . | c_sba == . | stay == . | c_earlybreast == . 
	}
	*/
	
	gen stay = 0 if m15 != .
	replace stay = 1 if stay == 0 & (inrange(m61,124,198)|inrange(m61,201,298)|inrange(m61,301,398))
	replace stay = . if inlist(m61,199,299,998) // filter question, based on m15
	gen c_sba_eff1 = (c_facdel == 1 & c_sba == 1 & stay == 1 & c_earlybreast == 1) 
	replace c_sba_eff1 = . if c_facdel == . | c_sba == . | stay == . | c_earlybreast == . 
	// you may need to check if this code work for all countries, which is the case in Recode VII. In this case, you don't need if inlist() anymore.
	
	
	*c_sba_eff1_q: Effective delivery care (baby delivered in facility, by skilled provider, mother and child stay in facility for min. 24h, breastfeeding initiated in first 1h after birth) among those with any SBA
	gen c_sba_eff1_q = c_sba_eff1 if c_sba == 1
	
	*c_sba_eff2: Effective delivery care (baby delivered in facility, by skilled provider, mother and child stay in facility for min. 24h, breastfeeding initiated in first 1h after birth, skin2skin contact)
	gen c_sba_eff2 = (c_facdel == 1 & c_sba == 1 & stay == 1 & c_earlybreast == 1 & c_skin2skin == 1) 
	replace c_sba_eff2 = . if c_facdel == . | c_sba == . | stay == . | c_earlybreast == . | c_skin2skin == .
	
	*c_sba_eff2_q: Effective delivery care (baby delivered in facility, by skilled provider, mother and child stay in facility for min. 24h, breastfeeding initiated in first 1h after birth, skin2skin contact) among those with any SBA
	gen c_sba_eff2_q =  c_sba_eff2 if c_sba == 1

	
