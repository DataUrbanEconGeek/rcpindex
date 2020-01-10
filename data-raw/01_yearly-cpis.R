import::from(magrittr, "%>%")

data("bls_cpi", package = "rcpindex")

yearly_cpis <- bls_cpi %>%
  dplyr::mutate(series_id = trimws(series_id, which = "right")) %>%
  dplyr::filter(series_id == "CUSR0000SA0") %>%
  dplyr::select(year, value) %>%
  dplyr::group_by(year) %>%
  dplyr::summarise(value = mean(value))


usethis::use_data(yearly_cpis, internal = TRUE, overwrite = TRUE)
