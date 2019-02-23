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

# calc life expectancy per country
lifetime_by_country <- gapminder %>%
  group_by(country) %>% 
  summarize(mean_life = mean(lifeExp))
lifetime_by_country

# max and min
lifetime_by_country %>%  filter(mean_life == min(mean_life))
lifetime_by_country %>%  filter(mean_life == max(mean_life))

# in dplyr sort is arrange()
lifetime_by_country %>% arrange(mean_life)  # ascending order
lifetime_by_country %>% arrange(desc(mean_life))

# use count() to find number of rows
gapminder %>% 
  filter(year == 1952) %>% 
  count(continent)

unique(gapminder$year)
unique(gapminder$continent)
unique(gapminder$gdpPercap)

# perform more than one function inside summarize
gapminder %>% 
  group_by(continent) %>% 
  summarize(
    mean_life = mean(lifeExp),
    se_life = sd(lifeExp)/sqrt(n())
  )

# using mutate
gdp_pop_summary <- gapminder %>% 
  mutate(gdp_billions = gdpPercap*pop/10^9) %>% 
  group_by(continent,year) %>% 
  summarize(mean_gdp_bill = mean(gdp_billions))
head(gdp_pop_summary)
