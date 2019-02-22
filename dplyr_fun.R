gapminder <- read.csv("data/gapminder_data.csv")
#subset in base R
mean(gapminder[gapminder$continent=="Africa","gdpPercap"])

#subsetting with base R is a little cryptic and difficult so maybe use dplyr instead
#load package
library(dplyr)
# select 3 columns from our data set. using deplyr.select() function
year_country_gdp <- gapminder %>% select(year,country,gdpPercap)

# select rows (aka 'filtering')
year_country_gdp_africa <- gapminder %>% filter(continent == "Africa")
# select rows (aka 'filtering') and pipe to a select
year_country_gdp_africa <- gapminder %>% filter(continent == "Africa") %>% select(year,country,gdpPercap)

# sumarise by groups
gdp_by_continent <- gapminder %>% 
  group_by(continent) %>%
  summarize(mean_gdp = mean(gdpPercap))
