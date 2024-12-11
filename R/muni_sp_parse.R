files <- fs::dir_ls("data-raw/html/municipio-sp")

leis <- files |>
  xml2::read_html() |>
  xml2::xml_find_all("//div[@class='bx-resultado']")

links <- leis |>
  xml2::xml_find_first(".//a") |>
  xml2::xml_attr("href")
