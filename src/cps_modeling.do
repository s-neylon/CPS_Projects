*************************
** Stata QP CPS Models **
*************************

cd "C:\Users\sneylon\OneDrive - City University of New York\CUNY! (Cloud)\R\CPS_Master\CPS_Master"

use "data\cpsDATA_STATA.dta"


***************************
** Weighted Panel FE ******
***************************

xtset ind1990 year, yearly

xtreg
