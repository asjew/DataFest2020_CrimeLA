from twitterscraper import query_tweets
import datetime as dt 
import pandas as pd 


begin_date = dt.date(2019,1,24)
end_date = dt.date(2020,5,11)


limit = 1500
lang = 'english'


tweets = query_tweets('anti-asian virus lang:en -filter:replies',begindate = begin_date, poolsize = 1500, enddate = end_date, limit = limit, lang = lang)

df = pd.DataFrame(t.__dict__ for t in tweets)
df.to_csv('/Users/derekwang/Downloads/run3.csv')