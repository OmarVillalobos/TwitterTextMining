# Twitter Text Mining 
# Packages
install.packages('twitteR')
install.packages('RCurl')

library(twitteR)
library(RCurl)

consumer_key <- "1OB3afJvf33uyPbbGK8QJsMc7"
consumer_secret <-  "v5ByEEIZOZ0LdEXJdCquikvTzaR2cf0xb1BC5lqcZLpXMC7RsY"
access_token <-  "897551639472742400-rxSPBJuiBipvBTku1MoeGvaBwUOb001"
access_secret <- "W8xwRz2u4VSx8B5Xi0i8NW4azskvdNJQUOjmP2ks7MJhU"

setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)

Sara_tweets <- searchTwitter("Sara Uribe", n=10000,
                            lang='es', since = '2017-01-01', geocode = '4.710988599999999,-74.072092,80mi')
Sara_tweets[1]
