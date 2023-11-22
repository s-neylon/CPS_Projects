# NOTE: This worksheet only works once data in CPS_union_estimates.Rmd is loaded and cleaned!!

cpsORG %>% filter(OCC2010 == 5620) %>%
  mutate(OCC_code = as.factor(OCC)) %>% 
  group_by(YEAR, OCC_code) %>% 
  summarise(OCC = n())

cpsORG %>% group_by(YEAR, MONTH) %>% count()

cpsORG %>% group_by(y_m) %>% summarise(n = n())

cpsORG %>% summarise(count = n_distinct(y_m))

pool_check <- union_check_pool(OCC_cat_title)

years_check <- occ_groups_check %>% group_by(OCC_cat_title) %>%
  summarise(USA_TotEMP = sum(TotEMP)/4,
            USA_unionEMP = sum(unionEMP)/4,
            NYC_TotEMP = sum(NYC_TotEMP)/4,
            NYC_unionEMP = sum(NYC_unionEMP)/4)

test_n_months <- cpsORG %>% summarise(count = n_distinct(y_m))
test_n_months <- test_n_months[1,1]

cpsORG %>% group_by(IND_cat_title) %>% count()

NA_table <- cpsORG %>% filter(is.na(IND_cat_title)) %>% group_by(IND) %>% count()

# Real Estate union?

RE_union <- cpsORG %>% filter(NYC==1) %>% filter(IND_cat_NAICS == "53" & unionMEM == 1)

## NOTE: This section also includes rental and leasing of automobiles, and other consumer goods rental

sector_table <- cpsORG %>% group_by(sector_worker) %>% count()

class_workers <- cpsORG %>% count(IND_cat_title, sector_worker, wt = EARNWT) %>% mutate(emp = n/47)

public_mfg <- cpsORG %>% filter(IND_cat_NAICS == "31-33") %>% count(IND, CLASSWKR)

fed_mfg <- cpsORG %>% filter(IND == 3680 | IND == 3580) %>% count(STATEFIP, sector_worker)

air_fed_mfg <- cpsORG %>% filter(IND == 3580 & sector_worker == "Public Worker") %>% count(STATEFIP, sector_worker)