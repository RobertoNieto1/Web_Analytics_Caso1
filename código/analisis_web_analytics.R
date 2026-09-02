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
datos_semana <- inner_join(
  weekly_visits,
  financials,
  by = "Week (2008-2009)"
)

View(datos_semana)
ggplot(datos_semana, aes(x = 1:nrow(datos_semana), y = `Unique Visits`)) +
  geom_line() +
  labs(
    title = "Unique Visits por semana",
    x = "Semana",
    y = "Unique Visits"
  )
ggplot(datos_semana, aes(x = 1:nrow(datos_semana), y = Revenue)) +
  geom_line() +
  labs(
    title = "Revenue por semana",
    x = "Semana",
    y = "Revenue"
  )

ggplot(datos_semana, aes(x = 1:nrow(datos_semana), y = Profit)) +
  geom_line() +
  labs(
    title = "Profit por semana",
    x = "Semana",
    y = "Profit"
  )

ggplot(datos_semana, aes(x = 1:nrow(datos_semana), y = `Lbs. Sold`)) +
  geom_line() +
  labs(
    title = "Lbs. Sold por semana",
    x = "Semana",
    y = "Lbs. Sold"
  )

View(datos_semana)
summary(datos_semana)
cor(datos_semana[,c("Unique Visits","Revenue","Profit","Lbs. Sold")])
ggplot(datos_semana, aes(x = `Lbs. Sold`, y = Revenue)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(
    title = "Relación entre libras vendidas e ingresos",
    x = "Lbs. Sold",
    y = "Revenue"
  )
ggplot(datos_semana, aes(x = `Unique Visits`, y = Revenue)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(
    title = "Relación entre visitas únicas e ingresos",
    x = "Unique Visits",
    y = "Revenue"
  )
ggplot(datos_semana, aes(x = Revenue, y = Profit)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(
    title = "Relación entre ingresos y utilidad",
    x = "Revenue",
    y = "Profit"
  )
summary(demographics)
table(demographics$`All Traffic Sources`)
table(demographics$`All Traffic Sources`)
traffic_sources <- sort(table(demographics$`All Traffic Sources`), decreasing = TRUE)

head(traffic_sources, 10)
traffic_sources2 <- sort(table(demographics$`Traffic Sources`), decreasing = TRUE)

head(traffic_sources2, 10)
names(demographics)
table(demographics$`...3`)
ggplot(datos_semana, aes(x = 1:nrow(datos_semana))) +
  geom_line(aes(y = Revenue, color = "Revenue")) +
  geom_line(aes(y = Profit, color = "Profit")) +
  labs(
    title = "Evolución semanal de ingresos y utilidad",
    x = "Semana",
    y = "Valor"
  )