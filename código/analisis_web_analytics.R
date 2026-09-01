library(readxl)
library(dplyr)
library(ggplot2)
datos_excel <- excel_sheets("data/Web_Analytics.xls")
datos_excel
weekly_visits <- read_excel(
  "data/Web_Analytics.xls",
  sheet = "Weekly Visits",
  skip = 3
)
View(weekly_visits)
financials <- read_excel(
  "data/Web_Analytics.xls",
  sheet = "Financials",
  skip = 3
)
View(financials)
lbs_sold <- read_excel(
  "data/Web_Analytics.xls",
  sheet = "Lbs. Sold",
  skip = 3
)
View(lbs_sold)
daily_visits <- read_excel(
  "data/Web_Analytics.xls",
  sheet = "Daily Visits",
  skip = 3
)
View(daily_visits)
demographics <- read_excel(
  "data/Web_Analytics.xls",
  sheet = "Demographics",
  skip = 3
)
View(demographics)