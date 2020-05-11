*****************************
***Postnatal Care************* 
****************************** 

    *c_pnc_skill: m52,m72 by var label text. (m52 is added in Recode VI.
	if ~inlist(name,"Armenia2010") {
	gen m52_skill = 0 if !mi(m52)
	replace m52_skill = 1 if inlist(m52,11,13,14,15,17)	
	replace m52_skill = . if mi(m52) | m52 == 99 
	
	gen m72_skill = 0 if !mi(m72)
	replace m52_skill = 1 if inlist(m72,11,13,14,15,17)	
	replace m52_skill = . if mi(m72) | m72 == 99 
		
	*c_pnc_any : mother OR child receive PNC in first six weeks by skilled 	health worker
    gen c_pnc_any = 0 if !mi(m70) & !mi(m50) 
    replace c_pnc_any = 1 if (m71 <= 306 & m72_skill == 1 ) | (m51 <= 306 & m52_skill == 1)
    replace c_pnc_any = . if inlist(m71,998)| inlist(m51,998,999)| m72_skill == . | m52_skill == .

	*c_pnc_eff: mother AND child in first 24h by skilled health worker	
	gen c_pnc_eff = .
	replace c_pnc_eff = 0 if !mi(m70) & !mi(m50) 
    replace c_pnc_eff = 1 if ((inrange(m51,100,124) | m51 == 201 ) & m52_skill == 1) & ((inrange(m71,100,124) | m71 == 201) & m72_skill == 1 )
    replace c_pnc_eff = . if inlist(m51,998,999) | m52_skill == . | inlist(m71,998) | m72_skill == .              
}

	if ~inlist(name,"Bangladesh2011") {
	gen m52_skill = 0 if !mi(m52)
	replace m52_skill = 1 if inlist(m52,11,12,13,14,15,16)	
	replace m52_skill = . if mi(m52) | m52 == 99 
	
	gen m72_skill = 0 if !mi(m72)
	replace m52_skill = 1 if inlist(m72,11,12,13,14,15,16)	
	replace m52_skill = . if mi(m72) | m72 == 99 
		
	*c_pnc_any : mother OR child receive PNC in first six weeks by skilled 	health worker
    gen c_pnc_any = 0 if !mi(m70) & !mi(m50) 
    replace c_pnc_any = 1 if (m71 <= 306 & m72_skill == 1 ) | (m51 <= 306 & m52_skill == 1)
    replace c_pnc_any = . if inlist(m71,998,999)| inlist(m51,998,999)| m72_skill == . | m52_skill == .

	*c_pnc_eff: mother AND child in first 24h by skilled health worker	
	gen c_pnc_eff = .
	replace c_pnc_eff = 0 if m51 != . | m52_skill != . | m71 != . | m72_skill != .   
    replace c_pnc_eff = 1 if ((inrange(m51,100,121) | m51 == 201 ) & m52_skill == 1) & ((inrange(m71,100,118) | m71 == 201) & m72_skill == 1 )
    replace c_pnc_eff = . if inlist(m51,998,999) | m52_skill == . | inlist(m71,998,999) | m72_skill == .              
}

	
	*c_pnc_eff_q: mother AND child in first 24h by skilled health worker among those with any PNC
	gen c_pnc_eff_q = c_pnc_eff
	replace c_pnc_eff_q = . if c_pnc_any == 0
	replace c_pnc_eff_q = . if c_pnc_any == . | c_pnc_eff == .
	
	*c_pnc_eff2: mother AND child in first 24h by skilled health worker and cord check, temperature check and breastfeeding counselling within first two days	
	gen c_pnc_eff2 = . 
	
	capture confirm variable m78a m78b m78d                            //m78* only available for Recode VII
	if _rc == 0 {
	egen check = rowtotal(m78a m78b m78d),mi
	replace c_pnc_eff2 = c_pnc_eff
	replace c_pnc_eff2 = 0 if check != 3
	replace c_pnc_eff2 = . if c_pnc_eff == . 
	}
	
	*c_pnc_eff2_q: mother AND child in first 24h weeks by skilled health worker and cord check, temperature check and breastfeeding counselling within first two days among those with any PNC
	gen c_pnc_eff2_q = c_pnc_eff2
	replace c_pnc_eff2_q = . if c_pnc_any == 0
	replace c_pnc_eff2_q = . if c_pnc_any == . | c_pnc_eff2 == .	