
df <- data.frame("Name" = c('Julius "Dr. J" Erving', "O'Brien", "Cook, Tim"),
                 "Age" = c(69, NA, 58))


# fwrite (data.table): fast and clean solution ----

library(data.table)

fwrite(df, file = "df.csv")

# => uses quotes only when necessary
# => replaces NA with blanks
# => omits row names


# write.csv (utils) ----

write.csv(df, file = "df.csv", row.names = FALSE, na="")

# issue: argument 'quote' wrapes either all fields in quotes (default: TRUE) or
#        none (FALSE)