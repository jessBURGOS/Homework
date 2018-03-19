

```python
#Import all necessary modules
import pandas as pd
import numpy as np
import os 

```


```python
#create the path and file
json_path =  os.path.join ("purchase_data.json")
file_df = pd.read_json(json_path)
file_df.count()
```




    Age          780
    Gender       780
    Item ID      780
    Item Name    780
    Price        780
    SN           780
    dtype: int64




```python
#Get generall feel of the data
file_df.columns
```




    Index(['Age', 'Gender', 'Item ID', 'Item Name', 'Price', 'SN'], dtype='object')




```python
#See what kind of types are in the data
file_df.dtypes
```




    Age            int64
    Gender        object
    Item ID        int64
    Item Name     object
    Price        float64
    SN            object
    dtype: object



** Player Count**


```python
#Total Number of Players
total_players = file_df["Item Name"].count()

total_players_df = pd.DataFrame({'Total Players': total_players}, index = [" "])
total_players_df
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
      <th>Total Players</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th></th>
      <td>780</td>
    </tr>
  </tbody>
</table>
</div>




**Purchasing Analysis (Total)**


```python
# Number of Unique Items
unique_items = file_df["Item Name"].nunique()
unique_items
```




    179




```python
#average purchases price
average_purchase = np.round((file_df["Price"].mean()),decimals=2)
average_purchase_clean = '${:,.2f}'.format(average_purchase)
average_purchase_clean
```




    '$2.93'




```python
# Total Number of Purchases
total_purchases = file_df["Price"].value_counts().sum()
total_purchases
```




    780




```python
# Total Revenue
total_revenue = pd.to_numeric(average_purchase) * (total_purchases)
total_revenue = '${:,.2f}'.format(total_revenue)
total_revenue
```




    '$2,285.40'




```python
purchasing_analysis_df = pd.DataFrame({'Number of Unique Items':unique_items,
                                      'Average Price':average_purchase_clean,
                                      'Number of Purchases': total_purchases,
                                      'Total Revenue': total_revenue}, index = [" "])
purchasing_analysis_df
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
      <th>Average Price</th>
      <th>Number of Purchases</th>
      <th>Number of Unique Items</th>
      <th>Total Revenue</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th></th>
      <td>$2.93</td>
      <td>780</td>
      <td>179</td>
      <td>$2,285.40</td>
    </tr>
  </tbody>
</table>
</div>



**Gender Demographics**


```python
file_df.groupby("Gender").count()
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
      <th>Age</th>
      <th>Item ID</th>
      <th>Item Name</th>
      <th>Price</th>
      <th>SN</th>
    </tr>
    <tr>
      <th>Gender</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Female</th>
      <td>136</td>
      <td>136</td>
      <td>136</td>
      <td>136</td>
      <td>136</td>
    </tr>
    <tr>
      <th>Male</th>
      <td>633</td>
      <td>633</td>
      <td>633</td>
      <td>633</td>
      <td>633</td>
    </tr>
    <tr>
      <th>Other / Non-Disclosed</th>
      <td>11</td>
      <td>11</td>
      <td>11</td>
      <td>11</td>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Percentage and Count of Male Players
filtered_male = len(file_df.loc[file_df["Gender"]=="Male"])
filtered_male_percent = (filtered_male/total_players).round(3)
filtered_male_percent = "{0:.2f}%".format(filtered_male_percent * 100) 
filtered_male_percent

```




    '81.20%'




```python
# Percentage and Count of Female Players
filtered_female = len(file_df.loc[file_df["Gender"]=="Female"])
filtered_female_percent = (filtered_female/total_players).round(3)
filtered_female_percent = "{0:.2f}%".format(filtered_female_percent * 100) 
filtered_female_percent
```




    '17.40%'




```python
file_df['Gender'].value_counts()

```




    Male                     633
    Female                   136
    Other / Non-Disclosed     11
    Name: Gender, dtype: int64




```python
#Percentage and Count of Other / Non-Disclosed

filtered_other = len(file_df.loc[file_df["Gender"]=="Other / Non-Disclosed"])
filtered_other_percent = (filtered_other/total_players).round(3)
filtered_other_percent = "{0:.2f}%".format(filtered_other_percent * 100) 
filtered_other_percent
```




    '1.40%'




```python
gender_demo_df = pd.DataFrame({'Total Count': [filtered_male, filtered_female,
                                                   filtered_other],
                               'Percentage of Players':[filtered_male_percent,
                                                        filtered_female_percent,
                                                        filtered_other_percent]}, 
                                index = ['Male', 'Female', 'Other / Non-Disclosed'])
gender_demo_df
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
      <th>Percentage of Players</th>
      <th>Total Count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Male</th>
      <td>81.20%</td>
      <td>633</td>
    </tr>
    <tr>
      <th>Female</th>
      <td>17.40%</td>
      <td>136</td>
    </tr>
    <tr>
      <th>Other / Non-Disclosed</th>
      <td>1.40%</td>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>



**Purchasing Analysis (Gender)** 


```python
# The below each broken by gender
grouped_count = pd.DataFrame(file_df.groupby(['Gender'])['Price'].count())


```


```python
#Average Purchase Price
grouped_purch = pd.DataFrame(file_df.groupby(['Gender'])['Price'].mean())



```


```python
#Total Purchase Value
group_purch_value = pd.DataFrame(file_df.groupby(['Gender'])['Price'].sum())



```


```python
normalized = group_purch_value.div(grouped_count.iloc[0], axis='columns')

```


```python
normalized.columns = ['Normalized Totals']
grouped_purch.columns = ['Average Purchase Price']
group_purch_value.columns = ['Total Purchase Value']
grouped_count.columns = ['Purchase Count']


purchasing_ana_gen =pd.concat([grouped_count,group_purch_value,normalized], axis=1)
purchasing_ana_gen
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
      <th>Purchase Count</th>
      <th>Total Purchase Value</th>
      <th>Normalized Totals</th>
    </tr>
    <tr>
      <th>Gender</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Female</th>
      <td>136</td>
      <td>382.91</td>
      <td>2.815515</td>
    </tr>
    <tr>
      <th>Male</th>
      <td>633</td>
      <td>1867.68</td>
      <td>13.732941</td>
    </tr>
    <tr>
      <th>Other / Non-Disclosed</th>
      <td>11</td>
      <td>35.74</td>
      <td>0.262794</td>
    </tr>
  </tbody>
</table>
</div>



**Age Demographics**


```python

# The below each broken into bins of 4 years (i.e. &lt;10, 10-14, 15-19, etc.) 
# Purchase Count
# Average Purchase Price
# Total Purchase Value
# Normalized Totals


```

**Top Spenders**


```python
purchase_amt_by_SN = pd.DataFrame(file_df.groupby('SN').sum()["Price"])
num_purchase_by_SN = pd.DataFrame(file_df.groupby('SN').count()["Price"])
avg_purchase_by_SN = pd.DataFrame(file_df.groupby('SN').mean()["Price"])

purchase_amt_by_SN = purchase_amt_by_SN.rename(columns={'Price': 'Total Purchase Value'})
num_purchase_by_SN = num_purchase_by_SN.rename(columns={'Price': 'Number of Purchases'})
avg_purchase_by_SN = avg_purchase_by_SN.rename(columns={'Price': 'Average Purchase'})


```


```python
top_spender_sn_df =pd.concat([purchase_amt_by_SN,num_purchase_by_SN,num_purchase_by_SN], axis=1)
top_spender_sn_df.sort_values("Total Purchase Value", ascending=False).head(5)
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
      <th>Total Purchase Value</th>
      <th>Number of Purchases</th>
      <th>Number of Purchases</th>
    </tr>
    <tr>
      <th>SN</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Undirrala66</th>
      <td>17.06</td>
      <td>5</td>
      <td>5</td>
    </tr>
    <tr>
      <th>Saedue76</th>
      <td>13.56</td>
      <td>4</td>
      <td>4</td>
    </tr>
    <tr>
      <th>Mindimnya67</th>
      <td>12.74</td>
      <td>4</td>
      <td>4</td>
    </tr>
    <tr>
      <th>Haellysu29</th>
      <td>12.73</td>
      <td>3</td>
      <td>3</td>
    </tr>
    <tr>
      <th>Eoda93</th>
      <td>11.58</td>
      <td>3</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
</div>



**Most Popular Items**


```python
# Identify the 5 most popular items by purchase count, then list (in a table):
# Item ID
# Item Name
# Purchase Count
# Item Price
# Total Purchase Value
```


```python
# pop_it= file_df[["Price","Item ID","Item Name"]]

# pop_sum = pd.DataFrame(file_df.groupby("Item Name").sum()["Price"])
# pop_sum = pop_sum.rename(columns={'Price': 'Total Purchase Value'})

# pop_count = pd.DataFrame(file_df.groupby("Item Name").count()["Price"])
# pop_count = pop_count.rename(columns={'Price': 'Purchase Count'})


```


```python
pop_it= file_df[["Price","Item ID","Item Name"]]

pop_sum = pd.DataFrame(pop_it.groupby("Item Name").sum()["Price"])


pop_count = pd.DataFrame(pop_it.groupby("Item Name").count()["Price"])

```


```python
op_df = pd.concat([pop_it, pop_sum, pop_count], axis=1)
op_df
```

    /Users/jessicaburgos/anaconda3/envs/PythonData/lib/python3.6/site-packages/pandas/core/indexes/api.py:57: RuntimeWarning: '<' not supported between instances of 'str' and 'int', sort order is undefined for incomparable objects
      union = _union_indexes(indexes)





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
      <th>Price</th>
      <th>Item ID</th>
      <th>Item Name</th>
      <th>Price</th>
      <th>Price</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>3.37</td>
      <td>165.0</td>
      <td>Bone Crushing Silver Skewer</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2.32</td>
      <td>119.0</td>
      <td>Stormbringer, Dark Blade of Ending Misery</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2.46</td>
      <td>174.0</td>
      <td>Primitive Blade</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1.36</td>
      <td>92.0</td>
      <td>Final Critic</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1.27</td>
      <td>63.0</td>
      <td>Stormfury Mace</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>5</th>
      <td>1.73</td>
      <td>10.0</td>
      <td>Sleepwalker</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>6</th>
      <td>4.57</td>
      <td>153.0</td>
      <td>Mercenary Sabre</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>7</th>
      <td>3.32</td>
      <td>169.0</td>
      <td>Interrogator, Blood Blade of the Queen</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>8</th>
      <td>2.77</td>
      <td>118.0</td>
      <td>Ghost Reaver, Longsword of Magic</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>9</th>
      <td>4.53</td>
      <td>99.0</td>
      <td>Expiration, Warscythe Of Lost Worlds</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>10</th>
      <td>3.81</td>
      <td>57.0</td>
      <td>Despair, Favor of Due Diligence</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>11</th>
      <td>1.55</td>
      <td>47.0</td>
      <td>Alpha, Reach of Ending Hope</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>12</th>
      <td>4.06</td>
      <td>81.0</td>
      <td>Dreamkiss</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>13</th>
      <td>3.68</td>
      <td>77.0</td>
      <td>Piety, Guardian of Riddles</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>14</th>
      <td>2.46</td>
      <td>44.0</td>
      <td>Bonecarvin Battle Axe</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>15</th>
      <td>4.77</td>
      <td>96.0</td>
      <td>Blood-Forged Skeletal Spine</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>16</th>
      <td>1.14</td>
      <td>123.0</td>
      <td>Twilight's Carver</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>17</th>
      <td>1.65</td>
      <td>59.0</td>
      <td>Lightning, Etcher of the King</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>18</th>
      <td>3.71</td>
      <td>91.0</td>
      <td>Celeste</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>19</th>
      <td>4.89</td>
      <td>177.0</td>
      <td>Winterthorn, Defender of Shifting Worlds</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>20</th>
      <td>2.33</td>
      <td>78.0</td>
      <td>Glimmer, Ender of the Moon</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>21</th>
      <td>1.79</td>
      <td>3.0</td>
      <td>Phantomlight</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>22</th>
      <td>2.52</td>
      <td>11.0</td>
      <td>Brimstone</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>23</th>
      <td>2.36</td>
      <td>183.0</td>
      <td>Dragon's Greatsword</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>24</th>
      <td>1.96</td>
      <td>65.0</td>
      <td>Conqueror Adamantite Mace</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>25</th>
      <td>1.27</td>
      <td>63.0</td>
      <td>Stormfury Mace</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>26</th>
      <td>3.90</td>
      <td>132.0</td>
      <td>Persuasion</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>27</th>
      <td>2.29</td>
      <td>106.0</td>
      <td>Crying Steel Sickle</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>28</th>
      <td>4.23</td>
      <td>49.0</td>
      <td>The Oculus, Token of Lost Worlds</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>29</th>
      <td>2.46</td>
      <td>45.0</td>
      <td>Glinting Glass Edge</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>Thorn, Conqueror of the Corrupted</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>4.08</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>Thorn, Satchel of Dark Souls</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>27.06</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>Thunderfury Scimitar</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>9.06</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>Toothpick</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>17.40</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>Torchlight, Bond of Storms</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>12.39</td>
      <td>7.0</td>
    </tr>
    <tr>
      <th>Tranquility, Razor of Black Magic</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>4.94</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>Trickster</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>18.63</td>
      <td>9.0</td>
    </tr>
    <tr>
      <th>Twilight's Carver</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>5.70</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>Undead Crusader</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>18.68</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>Unending Tyranny</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>3.63</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>Unholy Wand</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>7.52</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>Vengeance Cleaver</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>11.10</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>Venom Claymore</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>16.32</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>Verdict</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>3.40</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>Victor Iron Spikes</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>24.85</td>
      <td>7.0</td>
    </tr>
    <tr>
      <th>Vindictive Glass Edge</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>8.52</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>War-Forged Gold Deflector</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>11.19</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>Warmonger, Gift of Suffering's End</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>23.76</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>Warped Diamond Crusader</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>13.98</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>Warped Fetish</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>4.82</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>Warped Iron Scimitar</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>8.16</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>Whistling Mithril Warblade</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>17.28</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>Winter's Bite</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>2.78</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>Winterthorn, Defender of Shifting Worlds</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>19.56</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>Woeful Adamantite Claymore</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>11.16</td>
      <td>9.0</td>
    </tr>
    <tr>
      <th>Wolf</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>9.20</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>Wolf, Promise of the Moonwalker</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>13.16</td>
      <td>7.0</td>
    </tr>
    <tr>
      <th>Worldbreaker</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>6.58</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>Yearning Crusher</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>2.12</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>Yearning Mageblade</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>7.16</td>
      <td>4.0</td>
    </tr>
  </tbody>
</table>
<p>959 rows × 5 columns</p>
</div>




```python
%whos
```

    Variable                  Type         Data/Info
    ------------------------------------------------
    ave_p_val                 DataFrame                   Average Pu<...>                     4.89
    average_purchase          float64      2.93
    average_purchase_clean    str          $2.93
    avg_purchase_by_SN        DataFrame                     Average <...>n\n[573 rows x 1 columns]
    file_df                   DataFrame         Age                 <...>n\n[780 rows x 6 columns]
    filtered_female           int          136
    filtered_female_percent   str          17.40%
    filtered_male             int          633
    filtered_male_percent     str          81.20%
    filtered_other            int          11
    filtered_other_percent    str          1.40%
    gender_demo_df            DataFrame                          Per<...>       1.40%           11
    group_purch_value         DataFrame                           To<...>sed                 35.74
    groupe_purch_value        DataFrame                             <...> / Non-Disclosed    35.74
    grouped_count             DataFrame                           Pu<...>Disclosed              11
    grouped_purch             DataFrame                           Av<...>d                3.249091
    json_path                 str          purchase_data.json
    merged_top5               DataFrame                   Price\nSN <...>n\n[573 rows x 1 columns]
    most_pop                  DataFrame         Item ID             <...>           13.41    9.0  
    n                         DataFrame                           Av<...>               NaN    NaN
    normalized                DataFrame                           No<...>closed           0.262794
    np                        module       <module 'numpy' from '/Us<...>kages/numpy/__init__.py'>
    num_purchase_by_SN        DataFrame                     Number o<...>n\n[573 rows x 1 columns]
    on                        DataFrame         Age  Gender  Item ID<...> Mace   3.74     Saedue76
    op_df                     DataFrame                             <...>n\n[959 rows x 5 columns]
    os                        module       <module 'os' from '/Users<...>ata/lib/python3.6/os.py'>
    p                         DataFrame                             <...>n\n[183 rows x 2 columns]
    p_count                   DataFrame                     Age  Gen<...>n\n[573 rows x 5 columns]
    pc_count_female           int          136
    pc_count_male             int          633
    pc_count_other            int          11
    pd                        module       <module 'pandas' from '/U<...>ages/pandas/__init__.py'>
    pop                       DataFrame                             <...>n\n[179 rows x 1 columns]
    pop_count                 DataFrame                             <...>n\n[179 rows x 1 columns]
    pop_df                    DataFrame         Item ID             <...>n\n[780 rows x 5 columns]
    pop_it                    DataFrame         Price  Item ID      <...>n\n[780 rows x 3 columns]
    pop_ite                   DataFrame                             <...>n\n[183 rows x 2 columns]
    pop_item_count            DataFrame             Count\nItem ID  <...>n\n[183 rows x 1 columns]
    pop_item_pv               DataFrame             Total Purchase A<...>n\n[183 rows x 1 columns]
    pop_item_sum              DataFrame             Price\nItem ID  <...>n\n[183 rows x 1 columns]
    pop_sum                   DataFrame                             <...>n\n[179 rows x 1 columns]
    purchase_amt_by_SN        DataFrame                     Total Pu<...>n\n[573 rows x 1 columns]
    purchasing_ana_gen        DataFrame                           Pu<...> 35.74           0.262794
    purchasing_analysis_df    DataFrame      Average Price  Number o<...>        179     $2,285.40
    t                         DataFrame         Age Gender  Item ID <...> Mace   3.74     Saedue76
    top_spender               DataFrame                   Purchase C<...>NaN                 17.06
    top_spender_sn_df         DataFrame                     Total Pu<...>n\n[573 rows x 3 columns]
    total_p_val               DataFrame                 Price\nSN   <...>12.73\nEoda93       11.58
    total_players             int64        780
    total_players_df          DataFrame       Total Players\n             780
    total_purchases           int64        780
    total_revenue             str          $2,285.40
    unique_items              int          179
    y                         DataFrame                             <...>n\n[959 rows x 5 columns]



```python
op_df = pd.concat([pop_it, pop_item_pv, pop_item_count], axis=1)
op_df
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
      <th>Price</th>
      <th>Item ID</th>
      <th>Item Name</th>
      <th>Total Purchase Amount</th>
      <th>Count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>3.37</td>
      <td>165</td>
      <td>Bone Crushing Silver Skewer</td>
      <td>1.82</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2.32</td>
      <td>119</td>
      <td>Stormbringer, Dark Blade of Ending Misery</td>
      <td>9.12</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2.46</td>
      <td>174</td>
      <td>Primitive Blade</td>
      <td>3.40</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1.36</td>
      <td>92</td>
      <td>Final Critic</td>
      <td>1.79</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1.27</td>
      <td>63</td>
      <td>Stormfury Mace</td>
      <td>2.28</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>1.73</td>
      <td>10</td>
      <td>Sleepwalker</td>
      <td>3.96</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>4.57</td>
      <td>153</td>
      <td>Mercenary Sabre</td>
      <td>3.60</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>7</th>
      <td>3.32</td>
      <td>169</td>
      <td>Interrogator, Blood Blade of the Queen</td>
      <td>27.06</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>2.77</td>
      <td>118</td>
      <td>Ghost Reaver, Longsword of Magic</td>
      <td>23.46</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>9</th>
      <td>4.53</td>
      <td>99</td>
      <td>Expiration, Warscythe Of Lost Worlds</td>
      <td>4.08</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>10</th>
      <td>3.81</td>
      <td>57</td>
      <td>Despair, Favor of Due Diligence</td>
      <td>10.38</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>11</th>
      <td>1.55</td>
      <td>47</td>
      <td>Alpha, Reach of Ending Hope</td>
      <td>17.64</td>
      <td>7.0</td>
    </tr>
    <tr>
      <th>12</th>
      <td>4.06</td>
      <td>81</td>
      <td>Dreamkiss</td>
      <td>21.50</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>13</th>
      <td>3.68</td>
      <td>77</td>
      <td>Piety, Guardian of Riddles</td>
      <td>13.41</td>
      <td>9.0</td>
    </tr>
    <tr>
      <th>14</th>
      <td>2.46</td>
      <td>44</td>
      <td>Bonecarvin Battle Axe</td>
      <td>7.95</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>15</th>
      <td>4.77</td>
      <td>96</td>
      <td>Blood-Forged Skeletal Spine</td>
      <td>6.18</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>16</th>
      <td>1.14</td>
      <td>123</td>
      <td>Twilight's Carver</td>
      <td>12.44</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>17</th>
      <td>1.65</td>
      <td>59</td>
      <td>Lightning, Etcher of the King</td>
      <td>10.41</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>18</th>
      <td>3.71</td>
      <td>91</td>
      <td>Celeste</td>
      <td>12.39</td>
      <td>7.0</td>
    </tr>
    <tr>
      <th>19</th>
      <td>4.89</td>
      <td>177</td>
      <td>Winterthorn, Defender of Shifting Worlds</td>
      <td>7.96</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>20</th>
      <td>2.33</td>
      <td>78</td>
      <td>Glimmer, Ender of the Moon</td>
      <td>5.92</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>21</th>
      <td>1.79</td>
      <td>3</td>
      <td>Phantomlight</td>
      <td>9.81</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>22</th>
      <td>2.52</td>
      <td>11</td>
      <td>Brimstone</td>
      <td>21.42</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>23</th>
      <td>2.36</td>
      <td>183</td>
      <td>Dragon's Greatsword</td>
      <td>11.08</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>24</th>
      <td>1.96</td>
      <td>65</td>
      <td>Conqueror Adamantite Mace</td>
      <td>4.82</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>25</th>
      <td>1.27</td>
      <td>63</td>
      <td>Stormfury Mace</td>
      <td>4.12</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>26</th>
      <td>3.90</td>
      <td>132</td>
      <td>Persuasion</td>
      <td>7.52</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>27</th>
      <td>2.29</td>
      <td>106</td>
      <td>Crying Steel Sickle</td>
      <td>15.84</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>28</th>
      <td>4.23</td>
      <td>49</td>
      <td>The Oculus, Token of Lost Worlds</td>
      <td>3.04</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>29</th>
      <td>2.46</td>
      <td>45</td>
      <td>Glinting Glass Edge</td>
      <td>11.37</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>750</th>
      <td>1.28</td>
      <td>86</td>
      <td>Stormfury Lantern</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>751</th>
      <td>1.88</td>
      <td>179</td>
      <td>Wolf, Promise of the Moonwalker</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>752</th>
      <td>2.37</td>
      <td>116</td>
      <td>Renewed Skeletal Katana</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>753</th>
      <td>2.28</td>
      <td>4</td>
      <td>Bloodlord's Fetish</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>754</th>
      <td>1.36</td>
      <td>104</td>
      <td>Gladiator's Glaive</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>755</th>
      <td>1.88</td>
      <td>179</td>
      <td>Wolf, Promise of the Moonwalker</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>756</th>
      <td>1.20</td>
      <td>6</td>
      <td>Rusty Skull</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>757</th>
      <td>2.52</td>
      <td>11</td>
      <td>Brimstone</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>758</th>
      <td>1.21</td>
      <td>122</td>
      <td>Unending Tyranny</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>759</th>
      <td>2.20</td>
      <td>87</td>
      <td>Deluge, Edge of the West</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>760</th>
      <td>4.06</td>
      <td>81</td>
      <td>Dreamkiss</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>761</th>
      <td>1.24</td>
      <td>175</td>
      <td>Woeful Adamantite Claymore</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>762</th>
      <td>4.39</td>
      <td>52</td>
      <td>Hatred</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>763</th>
      <td>4.32</td>
      <td>48</td>
      <td>Rage, Legacy of the Lone Victor</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>764</th>
      <td>3.89</td>
      <td>70</td>
      <td>Hope's End</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>765</th>
      <td>1.49</td>
      <td>13</td>
      <td>Serenity</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>766</th>
      <td>2.23</td>
      <td>84</td>
      <td>Arcane Gem</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>767</th>
      <td>1.21</td>
      <td>122</td>
      <td>Unending Tyranny</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>768</th>
      <td>3.56</td>
      <td>158</td>
      <td>Darkheart, Butcher of the Champion</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>769</th>
      <td>3.74</td>
      <td>73</td>
      <td>Ritual Mace</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>770</th>
      <td>3.27</td>
      <td>141</td>
      <td>Persuasion</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>771</th>
      <td>1.03</td>
      <td>25</td>
      <td>Hero Cane</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>772</th>
      <td>2.07</td>
      <td>31</td>
      <td>Trickster</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>773</th>
      <td>2.46</td>
      <td>44</td>
      <td>Bonecarvin Battle Axe</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>774</th>
      <td>1.14</td>
      <td>123</td>
      <td>Twilight's Carver</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>775</th>
      <td>3.62</td>
      <td>98</td>
      <td>Deadline, Voice Of Subtlety</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>776</th>
      <td>1.36</td>
      <td>104</td>
      <td>Gladiator's Glaive</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>777</th>
      <td>4.15</td>
      <td>117</td>
      <td>Heartstriker, Legacy of the Light</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>778</th>
      <td>1.72</td>
      <td>75</td>
      <td>Brutality Ivory Warmace</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>779</th>
      <td>3.61</td>
      <td>107</td>
      <td>Splitter, Foe Of Subtlety</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
<p>780 rows × 5 columns</p>
</div>




```python
most_pop = pop_df.sort_values("Count", ascending=False).head(5)
most_pop
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
      <th>Item ID</th>
      <th>Item Name</th>
      <th>Price</th>
      <th>Total Purchase Amount</th>
      <th>Count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>39</th>
      <td>63</td>
      <td>Stormfury Mace</td>
      <td>1.27</td>
      <td>25.85</td>
      <td>11.0</td>
    </tr>
    <tr>
      <th>84</th>
      <td>7</td>
      <td>Thorn, Satchel of Dark Souls</td>
      <td>4.51</td>
      <td>24.53</td>
      <td>11.0</td>
    </tr>
    <tr>
      <th>31</th>
      <td>37</td>
      <td>Shadow Strike, Glory of Ending Hope</td>
      <td>1.93</td>
      <td>18.63</td>
      <td>9.0</td>
    </tr>
    <tr>
      <th>175</th>
      <td>34</td>
      <td>Retribution Axe</td>
      <td>4.14</td>
      <td>11.16</td>
      <td>9.0</td>
    </tr>
    <tr>
      <th>13</th>
      <td>77</td>
      <td>Piety, Guardian of Riddles</td>
      <td>3.68</td>
      <td>13.41</td>
      <td>9.0</td>
    </tr>
  </tbody>
</table>
</div>



**Most Profitable Items**


```python
# Identify the 5 most profitable items by total purchase value, then list (in a table):
# Item ID
# Item Name
# Purchase Count
# Item Price
# Total Purchase Value


```


```python
pop_it= file_df["Price","Item ID", "Item Name]
```


      File "<ipython-input-427-ceaad2ff5bd5>", line 1
        pop_it= file_df["Price","Item ID", "Item Name]
                                                      ^
    SyntaxError: EOL while scanning string literal




```python
op_df = pd.concat([pop_it, pop_item_pv, pop_item_count], axis=1)

pop_df.sort_values("Total Purchase Amount", ascending=False).head(5)
```


```python



# As final considerations:
# * You must submit a link to your Jupyter Notebook with the viewable Data Frames. 
# * You must include an exported markdown version of your Notebook called  `README.md` in your GitHub repository.  
# * You must include a written description of three observable trends based on the data. 


```
