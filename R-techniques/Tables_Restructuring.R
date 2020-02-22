library(data.table)


tbl_a <- data.table( 'store' = c('Store A', 'Store B', 'Store C'),
                     '2017'  = c(   452000,   1204000,    870000),
                     '2018'  = c(   523000,   1450000,    910000),
                     '2019'  = c(   420000,   1020000,    810000))


# melt() -----------------------------------------------------------------------

melt( tbl_a,
      measure.vars  = c( "2017",
                         "2018",
                         "2019"),
      variable.name = "year",
      value.name    = "sales")

# or:
melt( tbl_a,
      id.vars       = 'store',
      variable.name = "year",
      value.name    = "sales")

# keeping only sales for 2018 and 2019:
melt( tbl_a,
      id.vars       = 'store',
      measure.vars  = c( "2018",
                         "2019"),
      variable.name = "year",
      value.name    = "sales")



tbl_b <- data.table( 'store'    = c('Store A', 'Store B', 'Store C',
                                    'Store A', 'Store B', 'Store C',
                                    'Store A', 'Store B', 'Store C'),
                     'location' = c('NW',           'SW',      'ME',
                                    'NW',           'SW',      'ME',
                                    'NW',           'SW',      'ME'),
                     'year'     = c(     2017,      2017,      2017,
                                         2018,      2018,      2018,
                                         2019,      2019,      2019),
                     'sales' = c(      452000,   1204000,    870000,
                                       523000,   1450000,    910000,
                                       420000,   1020000,    810000))


# dcast() ----------------------------------------------------------------------

dcast( tbl_b,
       store ~    # each 'store' as a ROW
          year,   # each 'year' as a COLUMN
       value.var = 'sales')

dcast( tbl_b,
       store + location ~  # each 'store' + 'location' pair as a ROW
          year,            # each 'year' as a COLUMN
       value.var = 'sales')


