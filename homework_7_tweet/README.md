
# News Mood


```python
import tweepy
import numpy as np
import pandas as pd
from datetime import datetime
import matplotlib.pyplot as plt

# Import and Initialize Sentiment Analyzer
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
analyzer = SentimentIntensityAnalyzer()

# Twitter API Keys
from config import (consumer_key, 
                    consumer_secret, 
                    access_token, 
                    access_token_secret)

# Setup Tweepy API Authentication
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth, wait_on_rate_limit=True)
```


```python
target_user = ("@CNN","@CBSNews", "@FoxNews", "@nytimes","@BBC")
counter = 0
n_results = 100
sentiment_list= []
name1 =[]
name2 = []
pos = []
neg = []
neu = []
compound = []
date = []
text = []
for target in target_user: 
   
    for status in tweepy.Cursor(api.user_timeline, id=target ,tweet_mode="extended",results ='recent').items(n_results):
            tweet=status._json
            results = analyzer.polarity_scores(tweet["full_text"])
            text.append(tweet["full_text"])
            pos.append(results['pos'])
            neg.append(results['neg'])
            neu.append(results['neu'])
            compound.append(results['compound'])
            name1.append(target)
            name2.append(tweet['user']['name'])
            date.append(pd.to_datetime(tweet["created_at"]))
            counter += 1
        

```


```python
sentiment_df = pd.DataFrame({
        "User": name1,
        "Full Name": name2,
        "Compound": compound,
        "Positive": pos,
        "Neutral": neg,
        "Negative": neu,
        "Date": date,
        "Full Text": text})
sentiment_df.to_csv("tweet_sentiment.csv")
sentiment_df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Compound</th>
      <th>Date</th>
      <th>Full Name</th>
      <th>Full Text</th>
      <th>Negative</th>
      <th>Neutral</th>
      <th>Positive</th>
      <th>User</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>-0.7906</td>
      <td>2018-04-09 04:00:19</td>
      <td>CNN</td>
      <td>Son of former NHL player among those dead in C...</td>
      <td>0.632</td>
      <td>0.368</td>
      <td>0.000</td>
      <td>@CNN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>-0.4019</td>
      <td>2018-04-09 03:37:04</td>
      <td>CNN</td>
      <td>Deutsche Bank, Germany's biggest lender, is ge...</td>
      <td>0.863</td>
      <td>0.137</td>
      <td>0.000</td>
      <td>@CNN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0.5859</td>
      <td>2018-04-09 03:30:06</td>
      <td>CNN</td>
      <td>16-year-old breaks Commonwealth Games record t...</td>
      <td>0.759</td>
      <td>0.000</td>
      <td>0.241</td>
      <td>@CNN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>-0.5719</td>
      <td>2018-04-09 03:13:55</td>
      <td>CNN</td>
      <td>"A Quiet Place" leads box office as horror kee...</td>
      <td>0.764</td>
      <td>0.236</td>
      <td>0.000</td>
      <td>@CNN</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0.0000</td>
      <td>2018-04-09 03:00:19</td>
      <td>CNN</td>
      <td>4 questions Congress must ask Facebook CEO Mar...</td>
      <td>1.000</td>
      <td>0.000</td>
      <td>0.000</td>
      <td>@CNN</td>
    </tr>
  </tbody>
</table>
</div>



# Observation

# Scatter plot

Observation 1: The scatterplot alone does not show any obvious correlation. Thus, it's a good idea that we decided to do another kind of graph.

Observation 2: The New York Times' overall sentiment mean is almost close to zero. Suggesting that their word choice is the most neutral.

Observation 3: CBS overall sentiment mean is the most negative. This suggests that their word choice is the most negative.


```python
plt.scatter(np.arange(-len(sentiment_df[sentiment_df['User'] == "@CNN"]),0,1),
           sentiment_df[sentiment_df['User'] == "@CNN"]['Compound'], label = "CNN", color = 'red',edgecolor="black")

plt.scatter(np.arange(-len(sentiment_df[sentiment_df['User'] == "@CBSNews"]),0,1),
           sentiment_df[sentiment_df['User'] == "@CBSNews"]['Compound'], label = "CBSNews",color = 'green',edgecolor="black" )

plt.scatter(np.arange(-len(sentiment_df[sentiment_df['User'] == "@FoxNews"]),0,1),
           sentiment_df[sentiment_df['User'] == "@FoxNews"]['Compound'], label = "Fox",color = 'blue',edgecolor="black")

plt.scatter(np.arange(-len(sentiment_df[sentiment_df['User'] == "@nytimes"]),0,1),
           sentiment_df[sentiment_df['User'] == "@nytimes"]['Compound'], label = "New York Times",color = 'gold',edgecolor="black")

plt.scatter(np.arange(-len(sentiment_df[sentiment_df['User'] == "@BBC"]),0,1),
           sentiment_df[sentiment_df['User'] == "@BBC"]['Compound'], label = "BBC",color = 'lightblue',edgecolor="black")

plt.legend(bbox_to_anchor=(1, 1))
plt.xticks([-100, -80,-60, -40, -20,0], [100, 80, 60, 40, 20,0])
plt.ylim(-1, 1)
plt.title("Sentiment Analysis of Media Tweets(4/8/2018)")
plt.ylabel("Tweets Ago")
plt.xlabel("Tweet Polarity")
plt.grid(True)

plt.savefig("Sentiment Analysis.png")
plt.show()
```


![png](output_9_0.png)


# Bar Graph


```python
sentiment_means = (sentiment_df[sentiment_df['User'] == "@CNN"]['Compound'].mean(), 
               sentiment_df[sentiment_df['User'] == "@CBSNews"]['Compound'].mean(), 
               sentiment_df[sentiment_df['User'] == "@FoxNews"]['Compound'].mean(), 
               sentiment_df[sentiment_df['User'] == "@nytimes"]['Compound'].mean(),
               sentiment_df[sentiment_df['User'] == "@BBC"]['Compound'].mean())


fig, ax = plt.subplots()
ind = np.arange(len(sentiment_means))  
width = 1
cnn_mean = ax.bar(ind[0], sentiment_means[0], width, color='red',edgecolor="black")
cbs_mean = ax.bar(ind[1:], sentiment_means[1:], width, color='green',edgecolor="black")
fox_mean = ax.bar(ind[2:], sentiment_means[2:], width, color='blue',edgecolor="black")
ny_mean = ax.bar(ind[3:], sentiment_means[3:], width, color='gold',edgecolor="black")
bbc_mean = ax.bar(ind[4:], sentiment_means[4:], width, color='lightblue',edgecolor="black")


ax.set_ylabel('Tweet Polarity')
ax.set_title('Overall Media Sentiment Based on Twitter 4/8/2018')
ax.set_xticks(ind )
ax.set_xticklabels(('CNN', 'CBS', 'Fox', 'NYT', 'BCC'))

ax.set_autoscaley_on(False)
ax.set_ylim([-.25,.1])

plt.savefig("Overall Media Sentiment.png")
fig.show()
```

    /Users/jessicaburgos/anaconda3/envs/PythonData/lib/python3.6/site-packages/matplotlib/figure.py:418: UserWarning: matplotlib is currently using a non-GUI backend, so cannot show the figure
      "matplotlib is currently using a non-GUI backend, "



![png](output_11_1.png)



```python
sentiment_df[sentiment_df['User'] == "@nytimes"]['Compound'].mean()
```




    -0.000781999999999996


