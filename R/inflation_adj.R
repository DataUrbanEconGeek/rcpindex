#' Adjust for Inflation
#'
#' Adjust a price or amount for inflation
#' @param amt A numeric value that represents a dollar value.
#' @param from The year of the amt.
#' @param to The year you want to adjust the price to.

inflation_adj <- function(amt, from, to) {
  if (from < 1997 | to < 1997) stop("Can't choose year prior to 1997.")
  if (from > 2019 | to > 2019) stop("Can't choose year after to 2019.")

  f_q <- dplyr::enquo(from)
  t_q <- dplyr::enquo(to)

  #yearly_cpis <- get("yearly_cpis", parent.frame())
  from_coef <- dplyr::filter(yearly_cpis, year == !!f_q)$value
  to_coef <- dplyr::filter(yearly_cpis, year == !!t_q)$value

  adj_value <- round(amt * (to_coef / from_coef), digits = 2)

  return(adj_value)
}
