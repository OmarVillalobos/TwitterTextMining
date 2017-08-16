# Twitter Text Mining 
# Packages
install.packages('twitteR')
install.packages('RCurl')
install.packages("sm")
install.packages("tm")
install.packages('tidytext')

library(twitteR)
library(RCurl)
library(sm)
library(tm)

consumer_key <- "1OB3afJvf33uyPbbGK8QJsMc7"
consumer_secret <-  "v5ByEEIZOZ0LdEXJdCquikvTzaR2cf0xb1BC5lqcZLpXMC7RsY"
access_token <-  "897551639472742400-rxSPBJuiBipvBTku1MoeGvaBwUOb001"
access_secret <- "W8xwRz2u4VSx8B5Xi0i8NW4azskvdNJQUOjmP2ks7MJhU"

setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)

colombia.t <- function(text) {
  searchTwitter(paste(text), n=10000,
                lang='es', 
                since = '2017-01-01', 
                geocode = '4.710988599999999,-74.072092,80mi')
}


Sara_tweets <- searchTwitter("Sara Uribe", n=10000,
                            lang='es',
                            since = '2017-01-01',
                            geocode = '4.710988599999999,-74.072092,80mi')

Maria_tweets <- searchTwitter("María Cristina",n=10000,
                              lang='es',
                              since = '2017-01-01',
                              geocode = '4.710988599999999,-74.072092,80mi')
Catherine_tweets <- searchTwitter("Catherine Siachoque", n=10000,
                                  lang='es',
                                  since = '2017-01-01', 
                                  geocode = '4.710988599999999,-74.072092,80mi')
Lina_tweets <- searchTwitter("Lina Tejeiro",  n=10000,
                             lang='es',
                             since = '2017-01-01', 
                             geocode = '4.710988599999999,-74.072092,80mi')

sara.t <- colombia.t("Sara Uribe")

twitts <- data.frame()
for (i in 1:length(sara.t)) {
 twitts[i,1] <- sara.t[[i]]$text
 twitts[i,2] <- as.character(sara.t[[i]]$created)
}
twitts$V2 <- as.Date(twitts$V2, "%Y-%m-%d %H:%m:%s" )

library(dplyr)
library(ggplot2)

twitts.pday <- count(twitts,V2)
twitts.plot <- ggplot(twitts.pday, aes(V2,n)) + 
  geom_line()

stopwords <- data.frame(stopwords(kind = 'es'))
names(stopwords) <- "word"
stopwords$word <- as.character(stopwords$word)

library(tidytext)
text.mining <- twitts %>%
  unnest_tokens(word, V1) %>%
  anti_join(stopwords, by = "word") %>%
  count(word, sort = TRUE)






