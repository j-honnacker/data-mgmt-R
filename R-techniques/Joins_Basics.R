library(data.table)

tbl_a = data.table( 'id'    = c(1, 2, 3),
                    'value' = c("one", "two", "three"))

tbl_b = data.table( 'id'    = c(2, 3, 4),
                    'value' = c("zwei", "drei", "vier"))



# Joins using data.table -------------------------------------------------------

# INNER JOIN 'tbl_b' to 'tbl_a'
tbl_a[tbl_b, on = .(id), nomatch=0]

# RIGHT JOIN 'tbl_b' to 'tbl_a'
tbl_a[tbl_b, on = .(id)]

# FULL JOIN not possible with data.table



# Joins using merge() ----------------------------------------------------------

# INNER JOIN 'tbl_b' to 'tbl_a'
merge(tbl_a, tbl_b, by = "id")

# LEFT JOIN 'tbl_b' to 'tbl_a'
merge(tbl_a, tbl_b, by = "id", all.x = TRUE)

# RIGHT JOIN 'tbl_b' to 'tbl_a'
merge(tbl_a, tbl_b, by = "id", all.y = TRUE)

# FULL JOIN 'tbl_b' to 'tbl_a'
merge(tbl_a, tbl_b, by = "id", all = TRUE)

