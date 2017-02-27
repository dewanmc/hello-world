clear
do "/Users/michaeldewan/Dropbox/NSG files/Peds/Epilepsy/SEEG/Stats/DoFile_17-02-05.do"
gen angle90int = int(angle90)
gen pltfm_skllint = int(pltfm_skll)
gen skll_thckint = int(skll_thck)
gen skll_trgtint = int(skll_trgt)  
sum eple tple_pulloutrem
sum eple eple_outlierrem tple tple_outlierrem tple_pulloutrem
sum eple eple_outlierrem tple tple_outlierrem tple_pulloutrem, detail
summ tple if pullout==0 & outlier_tp==0, detail 
summ tple_outlierrem if pullout == 0, detail
** Trichotomized data <2, 2-5, >5mm
*EPLE
summ eple if eple<2
summ eple if eple>5
summ eple
*EPLE_outlierremoved
summ eple_outlierrem if eple<2
summ eple_outlierrem if eple>5
summ eple_outlierrem
*TPLE
summ tple if tple<2
summ tple if tple>5
summ tple
*TPLE_outlierremoved
summ tple_outlierrem if tple<2
summ tple_outlierrem if tple>5
summ tple_outlierrem
*TPLE_pulloutrem
summ tple_pulloutrem if tple<2
summ tple_pulloutrem if tple>5
summ tple_pulloutrem
*TPLE_outlier and pullout removed
summarize tple_outlierrem if pullout == 0, detail
summarize tple_outlierrem if pullout == 0 & tple<2, detail
summarize tple_outlierrem if pullout == 0 & tple>5, detail
*
