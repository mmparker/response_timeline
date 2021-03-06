


# Strings ain't factors
options(stringsAsFactors = FALSE)


# Load knitr and markdown to generate the report
library(knitr)
library(markdown)


# Identify the zip file containing the results
datafile <- list.files(pattern = "*.zip")

# Extract the collector list
collectors <- read.csv(unz(datafile, file.path("CSV", "CollectorList.csv")))


# Get the name of the first collector - if probably formatted, you should
# be able to strip the strategic area abbreviation from it
# Pattern: any non-space characters from the beginning until the first space
strat_area <- gsub(x = collectors$Title,
                   pattern = "(^\\S*)\\s.*",
                   replacement = "\\1")[1]


# Generate a name for the report output file
report_name <- paste(strat_area, "_", Sys.Date(), ".html", sep = "")


# Knit it
knit("response_timeline.rmd")

markdownToHTML(file = "response_timeline.md",
               output = file.path("reports", report_name),
               stylesheet = file.path("..", "qi_report.css"))


# Archive the data file
file.rename(from = datafile, to = file.path("archived_data", datafile))
     
# Remove the residual .md file
file.remove(list.files(pattern = "response_timeline.md"))
     
