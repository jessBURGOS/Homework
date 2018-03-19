

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
# Purchase Count
# pc_count_male = len(file_df.loc[file_df["Gender"]=="Male"])
# pc_count_female = len(file_df.loc[file_df["Gender"]=="Female"])
# pc_count_other = len(file_df.loc[file_df["Gender"]=="Other / Non-Disclosed"])
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
y =  file_df['SN'].groupby((file_df['Price']).sum())
y
```


    ---------------------------------------------------------------------------

    KeyError                                  Traceback (most recent call last)

    <ipython-input-255-6950e01b684d> in <module>()
    ----> 1 y =  file_df['SN'].groupby((file_df['Price']).sum())
          2 y


    ~/anaconda3/envs/PythonData/lib/python3.6/site-packages/pandas/core/generic.py in groupby(self, by, axis, level, as_index, sort, group_keys, squeeze, **kwargs)
       5160         return groupby(self, by=by, axis=axis, level=level, as_index=as_index,
       5161                        sort=sort, group_keys=group_keys, squeeze=squeeze,
    -> 5162                        **kwargs)
       5163 
       5164     def asfreq(self, freq, method=None, how=None, normalize=False,


    ~/anaconda3/envs/PythonData/lib/python3.6/site-packages/pandas/core/groupby.py in groupby(obj, by, **kwds)
       1846         raise TypeError('invalid type: %s' % type(obj))
       1847 
    -> 1848     return klass(obj, by, **kwds)
       1849 
       1850 


    ~/anaconda3/envs/PythonData/lib/python3.6/site-packages/pandas/core/groupby.py in __init__(self, obj, keys, axis, level, grouper, exclusions, selection, as_index, sort, group_keys, squeeze, **kwargs)
        514                                                     level=level,
        515                                                     sort=sort,
    --> 516                                                     mutated=self.mutated)
        517 
        518         self.obj = obj


    ~/anaconda3/envs/PythonData/lib/python3.6/site-packages/pandas/core/groupby.py in _get_grouper(obj, key, axis, level, sort, mutated, validate)
       2932                 in_axis, name, level, gpr = False, None, gpr, None
       2933             else:
    -> 2934                 raise KeyError(gpr)
       2935         elif isinstance(gpr, Grouper) and gpr.key is not None:
       2936             # Add key to exclusions


    KeyError: 2286.33



```python
# Total Purchase Value
total_p_val = pd.DataFrame((file_df.groupby(['SN'])['Price'].sum()).nlargest(5))
total_p_val
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
    </tr>
    <tr>
      <th>SN</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Undirrala66</th>
      <td>17.06</td>
    </tr>
    <tr>
      <th>Saedue76</th>
      <td>13.56</td>
    </tr>
    <tr>
      <th>Mindimnya67</th>
      <td>12.74</td>
    </tr>
    <tr>
      <th>Haellysu29</th>
      <td>12.73</td>
    </tr>
    <tr>
      <th>Eoda93</th>
      <td>11.58</td>
    </tr>
  </tbody>
</table>
</div>




```python
# p_count.columns = ['Purchase Count']
# ave_p_val.columns = ['Average Purchase Price']
# total_p_val.columns = ['Total Purchase Value']

# top_spender =pd.concat([p_count,ave_p_val,total_p_val], axis=1)
# top_spender
t = (file_df.loc[file_df['SN'].isin(['Undirrala66','Saedue76','Haellysu29','Eoda93'])])
t =
# t = file_df.loc[file_df['SN'].isin(([file_df.groupby(['SN'])['Price'].sum().nlargest(5)])]
                            
# t
# t = file_df.loc[file_df['SN'].isin([file_df.groupby((['SN'])['Price'].sum().nlargest(5))])]
# t
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
      <th>Gender</th>
      <th>Item ID</th>
      <th>Item Name</th>
      <th>Price</th>
      <th>SN</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>15</th>
      <td>21</td>
      <td>Male</td>
      <td>96</td>
      <td>Blood-Forged Skeletal Spine</td>
      <td>4.77</td>
      <td>Haellysu29</td>
    </tr>
    <tr>
      <th>79</th>
      <td>29</td>
      <td>Male</td>
      <td>144</td>
      <td>Blood Infused Guardian</td>
      <td>2.86</td>
      <td>Undirrala66</td>
    </tr>
    <tr>
      <th>107</th>
      <td>29</td>
      <td>Male</td>
      <td>115</td>
      <td>Spectral Diamond Doomblade</td>
      <td>4.25</td>
      <td>Undirrala66</td>
    </tr>
    <tr>
      <th>108</th>
      <td>22</td>
      <td>Male</td>
      <td>35</td>
      <td>Heartless Bone Dualblade</td>
      <td>2.63</td>
      <td>Eoda93</td>
    </tr>
    <tr>
      <th>131</th>
      <td>29</td>
      <td>Male</td>
      <td>62</td>
      <td>Piece Maker</td>
      <td>4.36</td>
      <td>Undirrala66</td>
    </tr>
    <tr>
      <th>166</th>
      <td>22</td>
      <td>Male</td>
      <td>173</td>
      <td>Stormfury Longsword</td>
      <td>4.83</td>
      <td>Eoda93</td>
    </tr>
    <tr>
      <th>259</th>
      <td>25</td>
      <td>Male</td>
      <td>13</td>
      <td>Serenity</td>
      <td>1.49</td>
      <td>Saedue76</td>
    </tr>
    <tr>
      <th>337</th>
      <td>25</td>
      <td>Male</td>
      <td>140</td>
      <td>Striker</td>
      <td>3.82</td>
      <td>Saedue76</td>
    </tr>
    <tr>
      <th>381</th>
      <td>21</td>
      <td>Male</td>
      <td>166</td>
      <td>Thirsty Iron Reaver</td>
      <td>4.25</td>
      <td>Haellysu29</td>
    </tr>
    <tr>
      <th>411</th>
      <td>25</td>
      <td>Male</td>
      <td>7</td>
      <td>Thorn, Satchel of Dark Souls</td>
      <td>4.51</td>
      <td>Saedue76</td>
    </tr>
    <tr>
      <th>488</th>
      <td>22</td>
      <td>Male</td>
      <td>76</td>
      <td>Haunted Bronzed Bludgeon</td>
      <td>4.12</td>
      <td>Eoda93</td>
    </tr>
    <tr>
      <th>537</th>
      <td>29</td>
      <td>Male</td>
      <td>18</td>
      <td>Torchlight, Bond of Storms</td>
      <td>1.77</td>
      <td>Undirrala66</td>
    </tr>
    <tr>
      <th>596</th>
      <td>29</td>
      <td>Male</td>
      <td>133</td>
      <td>Faith's Scimitar</td>
      <td>3.82</td>
      <td>Undirrala66</td>
    </tr>
    <tr>
      <th>659</th>
      <td>21</td>
      <td>Male</td>
      <td>91</td>
      <td>Celeste</td>
      <td>3.71</td>
      <td>Haellysu29</td>
    </tr>
    <tr>
      <th>708</th>
      <td>25</td>
      <td>Male</td>
      <td>73</td>
      <td>Ritual Mace</td>
      <td>3.74</td>
      <td>Saedue76</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Identify the the top 5 spenders in the game by total purchase value, then list (in a table):
# SN
# Purchase Count
p_count = pd.DataFrame((file_df.groupby(['SN'])['Price'].count()).nlargest(5))
p_count

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
    </tr>
    <tr>
      <th>SN</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Undirrala66</th>
      <td>5</td>
    </tr>
    <tr>
      <th>Hailaphos89</th>
      <td>4</td>
    </tr>
    <tr>
      <th>Mindimnya67</th>
      <td>4</td>
    </tr>
    <tr>
      <th>Qarwen67</th>
      <td>4</td>
    </tr>
    <tr>
      <th>Saedue76</th>
      <td>4</td>
    </tr>
  </tbody>
</table>
</div>




```python
# average Purchase Price
ave_p_val = pd.DataFrame((file_df.groupby(['SN'])['Price'].mean()).nlargest(5))
ave_p_val
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
    </tr>
    <tr>
      <th>SN</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Frichaststa61</th>
      <td>4.95</td>
    </tr>
    <tr>
      <th>Palurrian69</th>
      <td>4.95</td>
    </tr>
    <tr>
      <th>Qiluard68</th>
      <td>4.95</td>
    </tr>
    <tr>
      <th>Tyarithn67</th>
      <td>4.95</td>
    </tr>
    <tr>
      <th>Assossa43</th>
      <td>4.89</td>
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
#Total Purchase Value
```

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



# As final considerations:
# * You must submit a link to your Jupyter Notebook with the viewable Data Frames. 
# * You must include an exported markdown version of your Notebook called  `README.md` in your GitHub repository.  
# * You must include a written description of three observable trends based on the data. 


```
