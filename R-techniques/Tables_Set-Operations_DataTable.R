library(data.table)

tbl_a <- data.table( 'col_1' = c(1, 2, 3),
                     'col_2' = c("one", "two", "three"))

tbl_b1 <- data.table( 'col_1' = c(3, 4, 5),
                      'col_2' = c("three", "four", "five"))

tbl_b2 <- tbl_b1[, .(col_1 = col_1,
                     col2  = col_2)]


# UNION ALL using rbind() ------------------------------------------------------

# Concatenate 2 tables of the same structure
rbind( tbl_a, tbl_b1 )

# ...and add an ID column (1/2)
rbind( tbl_a, tbl_b1, idcol = TRUE)

# ...and add an ID column (2/2)
rbind( 'Table A' = tbl_a,
       'Table B' = tbl_b1, idcol = 'Source Table' )

# ...but with different column names
rbind( tbl_a, tbl_b2, use.names=FALSE )


# Concatenate 2 tables of different structures
rbind( tbl_a, tbl_b2, fill=TRUE )


# Concatenate more than 2 tables
rbind( tbl_a, tbl_b1, tbl_b2, fill = TRUE)



tbl_c = data.table( 'col_1' = c('a', 'b', 'b', 'c', 'c', 'c'),
                    'col_2' = c( 1 ,  2 ,  2 ,  3 ,  3 ,  3 ))

tbl_d = data.table( 'col_1' = c(     'b',      'c', 'c',      'd'),
                    'col_2' = c(      2 ,       3 ,  3 ,       4 ))


# UNION (ALL) using funion() ---------------------------------------------------

funion( tbl_c, tbl_d )

funion( tbl_c, tbl_d, all = TRUE)


# INTERSECT using fintersect() -------------------------------------------------

fintersect( tbl_c, tbl_d )

fintersect( tbl_c, tbl_d, all = TRUE )


# EXCEPT using fsetdiff() ------------------------------------------------------

fsetdiff( tbl_c, tbl_d )

fsetdiff( tbl_c, tbl_d, all = TRUE )
