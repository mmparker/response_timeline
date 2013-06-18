


# Strings ain't factors
options(stringsAsFactors = FALSE)


# Load knitr and markdown to generate the report
library(knitr)
library(markdown)


# Knit it
knit("response_timeline.rmd")

markdownToHTML(file = "response_timeline.md",
               output = "response_timeline.html",
               stylesheet = file.path("..", "qi_report.css"))

     
