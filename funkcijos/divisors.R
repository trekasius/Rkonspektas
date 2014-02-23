
# Funkcija suranda visus natûrinio skaièiaus x daliklius.
#
# Parametrai: x -- tikrinamas natûrinis skaièius.
# Rezultatas: d -- skaièiaus x dalikliø vektorius.


visi.dalikliai <- function(x) {

  x <- as.integer(x)
  s <- seq_len(abs(x))
  d <- s[x %% s == 0L]

  return(d)
}
