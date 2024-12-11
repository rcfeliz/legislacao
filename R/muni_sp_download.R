
# exemplo -----------------------------------------------------------------

assunto <- ""
# dt_ini <- "29/09/1892"
dt_ini <- "01/01/2024"
dt_fim <- lubridate::today() |>
  format("%d/%m/%Y")

# download ----------------------------------------------------------------

url <- "https://legislacao.prefeitura.sp.gov.br/busca"

response <- httr2::request(url) |>
  httr2::req_body_form(
    "assunto" = assunto,
    "ano-inicial" = dt_ini,
    "ano-final" = dt_fim
  ) |>
  httr2::req_perform() |>
  httr2::resp_body_string()

writeLines(response, "data-raw/html/municipio-sp/sp.html")
