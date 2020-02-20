library(data.table)

tbl_a = data.table( 'id'    = c(1, 2, 3),
                    'value' = c("one", "two", "three"))

tbl_b = data.table( 'id'    = c(2, 3, 4),
                    'value' = c("zwei", "drei", "vier"))



# Joins using data.table -------------------------------------------------------

# INNER JOIN 'tbl_b' to 'tbl_a'
tbl_a[tbl_b, on = .(id), nomatch = 0]
tbl_a[tbl_b, on =  'id', nomatch = 0]

# RIGHT JOIN 'tbl_b' to 'tbl_a'
tbl_a[tbl_b, on = .(id)]

# FULL JOIN not possible with data.table



# Joins using merge() ----------------------------------------------------------

# INNER JOIN 'tbl_b' to 'tbl_a'
merge(tbl_a, tbl_b, by = 'id')

# LEFT JOIN 'tbl_b' to 'tbl_a'
merge(tbl_a, tbl_b, by = 'id', all.x = TRUE)

# RIGHT JOIN 'tbl_b' to 'tbl_a'
merge(tbl_a, tbl_b, by = 'id', all.y = TRUE)

# FULL JOIN 'tbl_b' to 'tbl_a'
merge(tbl_a, tbl_b, by = 'id', all = TRUE)



# Composite joins --------------------------------------------------------------

tbl_c = data.table( 'id1'   = c(1, 2, 3),
                    'id2'   = c(3, 2, 1),
                    'value' = c("thirteen", "twenty-two", "thirty-one"))

tbl_d = data.table( 'id1'   = c(2, 3, 4),
                    'id2'   = c(2, 1, 0),
                    'value' = c("zweiundzwanzig", "einunddreissig", "vierzig"))


# Composite join using data.table
tbl_c[tbl_d, on = .( id1 ,  id2 ), nomatch = 0]
tbl_c[tbl_d, on = c('id1', 'id2'), nomatch = 0]


# Composite join using merge()
merge(tbl_c, tbl_d, by = c('id1', 'id2'))