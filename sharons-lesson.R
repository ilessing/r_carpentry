# 2019-02-22
library("ggplot2")

gapminder <- read.csv("data/gapminder_data.csv", header=TRUE)
rm(cats)
rm(newRow)
rm(age)
rm(human_age)

# data subsetting
gapminder[1,2]

# look at row 1
gapminder[1,]

# preview top few lines
head(gapminder)
tail(gapminder)

# look at middle of dataset
gapminder[900:905,]

# first plot
ggplot(data = gapminder, aes(x=gdpPercap, y= lifeExp)) + geom_point()

# show change over time
ggplot(data = gapminder, aes(x=year, y= lifeExp )) + geom_point()

# color code the dots by continent
ggplot(data = gapminder, aes(x=year, y= lifeExp, color = continent )) + geom_point()

# a line graph
ggplot(data = gapminder, aes(x=year, y= lifeExp, by=country, color = continent )) + geom_line()

# useless
countries_char <- as.character(gapminder$country)
gapminder2 <- cbind(gapminder,countries_char)
ggplot(data = gapminder2, aes(x=year, y= lifeExp, by=countries_char, color = continent )) + geom_line()

# leaving out by country
ggplot(data = gapminder2, aes(x=year, y= lifeExp,  color = continent )) + geom_line()

# adding a layer
ggplot(data=gapminder, aes(x=year, y=lifeExp, by=country,color=continent)) + geom_line() + geom_point() + theme_bw()
rm(gapminder2)

# draw points on top of lines, black color for points
ggplot(data=gapminder, aes(x=year, y=lifeExp, by=country)) + geom_line(aes(color=continent)) + geom_point() + theme_bw()
rm(gapminder2)

# reverse order of drawing layers
ggplot(data=gapminder, aes(x=year, y=lifeExp, by=country)) + geom_point() + geom_line(aes(color=continent)) + theme_bw()

# line number one except we introduced color
ggplot(data = gapminder, aes(x=gdpPercap, y= lifeExp, color=continent)) + geom_point()

# change x axis, use scale function and alpha function to have transparent dots
ggplot(data = gapminder, aes(x=gdpPercap, y= lifeExp, color=continent)) + geom_point(alpha=0.5) + scale_x_log10()

?scale_x_log10

# geom_smooth adding another data layer
ggplot(data = gapminder, aes(x=gdpPercap, y= lifeExp, color=continent)) + geom_point(alpha=0.5) + scale_x_log10() + geom_smooth(method = "lm")

# thicker line
ggplot(data = gapminder, aes(x=gdpPercap, y= lifeExp, color=continent)) + geom_point(alpha=0.5, size= 2.5, colour="steelblue2", shape= 10) + scale_x_log10() + geom_smooth(method = "lm", size=1.5)

# look at the help to see the various point types/numbers
?points

