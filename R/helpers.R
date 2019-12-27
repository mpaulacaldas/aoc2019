aoc_txt <- function(day) {
  file <- sprintf("data-raw/day%s.txt", formatC(day, width = 2, flag = "0"))
  file.edit(file, fileEncoding = "UTF-8")
}

aoc_rmd <- function(day, title) {

  pday <- formatC(day, width = 2, flag = "0")

  data <- list(day = day, pday = pday, title = title)
  template <- readLines(
    system.file("template.Rmd", package = "aoc2019"),
    encoding = "UTF-8"
    )
  rendered_template <- whisker::whisker.render(template, data)

  file <- sprintf("%s-%s.Rmd", pday, gsub("\\s", "-", tolower(title)))

  cat(rendered_template, file = file)
  file.edit(file, fileEncoding = "UTF-8")

}
