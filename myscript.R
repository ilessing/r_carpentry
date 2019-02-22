cats<-data.frame(coat=c("calico", "black", "tabby"),weight=c(2.1,3.4,5.6),likes_string= c(1,0,1))
cats
write.csv(x=cats, file="data/feline.csv", row.names=FALSE)
cats$coat



# we discover weight 2 kg light
cats$weight+2
paste("my cat is ", cats$coat)
cats$coat+cats$weight
typeof(cats$likes_string)
typeof(cats$weight)
typeof(cats$coat)
class(cats$coat)
typeof("a")
typeof(x)
file.show("data/feline.csv")
cats <- read.csv(file="data/feline2.csv")
cats
str(cats$coat)
my_vector <-vector(length = 3)
my_vector
another_vector <- vector(mode = 'character', length = 3)
another_vector
str(another_vector)
