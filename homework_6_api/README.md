
# WeatherPy


```python
import json
import requests
import matplotlib.pyplot as plt
import pandas as pd
from citipy import citipy
import random
from config import api_key

```


```python
temp = []
lats = []
humid = [] 
cloud = []
wind = [] 
city_name=[]
```


```python
all_cities =(citipy.WORLD_CITIES_DICT)
city_list = random.sample(list(all_cities), 1000 )

```


```python
latitude, longitude = zip(*city_list)
lat =list(latitude)
list_lat = [str(x) for x in lat]
lon =list(longitude)
list_lon = [str(x) for x in lon]

```


```python
url = "http://api.openweathermap.org/data/2.5/weather?"
query_url = f"{url}appid={api_key}&lat="
query_url
```




    'http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat='



# Observable Trends

Observation #1 

The highest temperatures can be found in latitudes between -20 and 20. This sugegsts that is is warmest around the equator.


Observation #2

There does not appear to be any direct correlation between latitude and cloudiness.

Observation #3

Overall, windspeeds are relatively uniform. There majority of windpeeds recorded are below 15mph.

# Creating Dataframe


```python
for la, lo in list(zip(list_lat, list_lon)):
    response_0 = requests.get(query_url + la + "&lon="+ lo 
                            +"&units=imperial&q=")
    print(response_0.url)
    response = response_0.json()
    temp.append(response['main']['temp'])
    lats.append(response['coord']['lat'])
    humid.append(response['main']['humidity'])
    cloud.append(response['clouds']['all'])
    wind.append(response['wind']['speed'])
    city_name.append(response['name'])

```

    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-19.55&lon=169.2666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=19.983333&lon=-101.283333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=10.8018&lon=121.9499&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=39.15&lon=23.8666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.616667&lon=15.166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=42.075&lon=-72.0338889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=5.2618&lon=120.0807&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=29.466667&lon=77.35&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.166667&lon=23.5&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-18.833333&lon=-50.133333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=6.031111&lon=120.991944&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=2.1&lon=99.833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-13.6833333&lon=-172.1166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.06337&lon=8.523485&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=27.549444&lon=109.959167&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=8.833333&lon=124.95&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=57.828782&lon=34.038339&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=26.783333&lon=84.733333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.9297222&lon=41.6925&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=37.101782&lon=-8.674242&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=56.170146&lon=9.565162&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=27.448082&lon=67.797761&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=17.85&lon=-93.383333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.333333&lon=9.2&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.659167&lon=123.339167&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-23.7&lon=-46.55&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.5&lon=-80.216667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=12.978056&lon=123.822222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=8.794444&lon=-74.165833&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-24.733333&lon=-53.75&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.183333&lon=25.766667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=32.647931&lon=73.010582&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.066667&lon=14.333333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.4397222&lon=-81.7355556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.066667&lon=22.2&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=30.15&lon=62.6&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=22.216667&lon=70.383333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=36.5483333&lon=-82.5619444&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.633333&lon=-102.433333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=31.616667&lon=130.4&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.333333&lon=8.483333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=58.233333&lon=8.133333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.504283&lon=19.749657&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=42.45&lon=-73.2458333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-27.161131&lon=152.959442&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.216667&lon=123.55&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.816667&lon=76.216667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.135947&lon=28.443357&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-4.133333&lon=104.166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=37.9166667&lon=21.2333333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.949524&lon=55.173141&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.466667&lon=26.133333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=19.816667&lon=84.8&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.5&lon=26.65&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.833333&lon=123.316667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=20.533333&lon=73.183333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=10.716667&lon=124.0&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=12.013&lon=124.8118&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=42.444233&lon=46.551722&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=64.523222&lon=34.766796&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=36.768056&lon=10.275278&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.25&lon=8.116667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=42.4330556&lon=-82.9241667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.8452778&lon=-73.3355556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=29.9183333&lon=-90.2108333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=9.6783&lon=122.4335&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=62.23487&lon=44.998525&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=34.2541667&lon=-110.0291667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=23.166667&lon=72.816667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=27.283333&lon=88.266667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=8.0666667&lon=22.4&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-35.3386&lon=143.559525&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.188893&lon=29.526971&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=5.8231&lon=116.0466&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=19.360278&lon=-99.351389&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=36.9102778&lon=-121.7558333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.633333&lon=-53.1&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-29.9&lon=-50.266667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.183333&lon=27.533333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.483333&lon=24.1&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.526944&lon=60.077778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=17.924392&lon=121.91305&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=34.066667&lon=132.966667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=9.4335&lon=123.3595&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=34.666667&lon=131.85&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=1.6333333&lon=11.3166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=42.741926&lon=47.355315&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.252&lon=120.0169&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.1463&lon=121.4729&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.95&lon=-92.166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-3.4833333&lon=-80.2333333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-6.816667&lon=-38.05&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=8.335&lon=126.334722&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.5858&lon=39.3599&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=6.090556&lon=124.423333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=8.022778&lon=125.1375&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=6.980278&lon=125.078056&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-22.966667&lon=-45.55&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=5.463041&lon=-74.654363&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=56.13143&lon=41.703199&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=37.287661&lon=-6.054101&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=6.0666667&lon=-8.1280556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-4.166667&lon=-38.466667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.592457&lon=18.932122&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.25&lon=-83.55&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=9.8223&lon=124.1964&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.925&lon=-93.4625&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.916667&lon=27.333333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.7838&lon=122.0902&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.616667&lon=14.366667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.2166667&lon=-59.5833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.3224&lon=81.498&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.183333&lon=13.8&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=22.95&lon=88.566667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.766667&lon=25.066667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=7.6&lon=4.183333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=4.48178&lon=118.611185&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=27.483333&lon=94.583333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=33.943056&lon=131.251111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=21.15&lon=79.1&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.840833&lon=37.713611&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=39.4694444&lon=-76.8297222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.95&lon=26.3&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.3072222&lon=-111.9594444&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.163103&lon=54.991756&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.834248&lon=25.45821&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.15&lon=21.266667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.3741&lon=103.2863&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.7447222&lon=-89.6730556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.966667&lon=25.966667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=10.1602778&lon=-68.895&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-46.35&lon=168.016667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.910197&lon=2.553235&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=32.305774&lon=34.909111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=30.283333&lon=75.583333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.7763889&lon=-73.4677778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.25&lon=24.9166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.783333&lon=12.116667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.283333&lon=14.366667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=54.887358&lon=9.680958&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.5827778&lon=-6.1083333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=32.216667&lon=130.4&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.6375&lon=-70.9041667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=63.755278&lon=121.624722&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=10.0738889&lon=-69.3227778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.016667&lon=13.65&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.924308&lon=6.867316&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=17.6172&lon=120.6542&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=56.209167&lon=33.488882&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.616667&lon=25.466667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.63108&lon=2.361942&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.85&lon=25.183333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.9675&lon=120.3515&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-13.5333333&lon=28.15&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=52.35&lon=14.55&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=63.602288&lon=53.881751&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=16.916667&lon=-92.483333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=56.6732&lon=60.9807&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=34.013784&lon=-6.844268&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.45&lon=120.433333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=29.7&lon=77.683333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.55&lon=-1.483333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=7.118896&lon=126.488382&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=11.233333&lon=79.733333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=58.6158333&lon=25.0969444&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.1166667&lon=-88.1&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=10.8726&lon=123.5209&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=38.15&lon=23.8333333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=5.29606&lon=-75.561197&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.175403&lon=29.61333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=12.3392&lon=125.0313&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.766667&lon=14.466667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=19.966667&lon=-98.85&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=11.8666667&lon=-86.05&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.8264&lon=119.9077&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-7.933333&lon=-35.35&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=59.276111&lon=30.1425&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=23.666667&lon=-100.183333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.4822222&lon=-88.07&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=58.333333&lon=8.233333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=2.15&lon=45.1166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=38.05&lon=21.35&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=27.25&lon=78.2&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.932857&lon=18.017489&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=11.75&lon=-13.2&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=58.3158333&lon=26.7241667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.233333&lon=23.866667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=4.3166667&lon=22.55&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=57.6&lon=-4.45&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=7.308611&lon=125.848056&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=63.906067&lon=38.140348&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-0.4869444&lon=15.9080556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=28.216667&lon=-106.583333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=39.0297222&lon=26.4483333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.665335&lon=19.436104&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-14.661639&lon=17.688224&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=2.509491&lon=-76.844185&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=21.45713&lon=110.765907&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.1544444&lon=45.5022222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.324758&lon=47.955504&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-26.092835&lon=27.790701&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-7.833333&lon=-34.9&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=35.666667&lon=139.483333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.6&lon=13.316667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-23.4&lon=21.7166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.133333&lon=24.783333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=54.980556&lon=-1.450833&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.933333&lon=20.833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.066667&lon=9.266667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.924722&lon=-90.662778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.802546&lon=7.236579&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=37.6666667&lon=22.1833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=22.9333333&lon=97.75&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.483333&lon=27.1&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-1.8833333&lon=-80.0833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=20.666667&lon=-103.333333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.75&lon=24.866667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=8.878333&lon=124.7975&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=36.784444&lon=119.946389&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=35.871944&lon=14.441111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.983333&lon=7.733333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=3.986946&lon=-73.757971&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=20.566667&lon=-100.25&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-5.583333&lon=-42.616667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.15&lon=26.983333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.083333&lon=25.266667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=38.06173&lon=-1.048283&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.316667&lon=8.416667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=55.433333&lon=-116.483333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=17.683333&lon=77.616667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-9.5&lon=-40.5&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.2669444&lon=43.5905556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=6.444167&lon=124.926389&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=37.5894444&lon=68.6608333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=11.5749&lon=122.4284&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.638936&lon=17.207852&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=42.7480556&lon=-71.8547222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.5&lon=-115.066667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=39.9166667&lon=65.9666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-3.633333&lon=-39.5&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-27.452402&lon=23.432456&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.505833&lon=-3.577222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-25.9666667&lon=31.1333333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.9&lon=20.95&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.7&lon=5.85&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.554021&lon=1.534106&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=10.698889&lon=124.008611&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=59.683333&lon=30.434722&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.0&lon=-1.133333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-21.55&lon=-45.733333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.3530556&lon=17.5894444&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.18633&lon=0.653568&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.5136111&lon=5.8961111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=21.333333&lon=-98.966667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=2.050146&lon=-75.976749&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.4111111&lon=-114.3366667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=1.145&lon=33.7094444&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=8.5208&lon=123.2324&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=54.951809&lon=73.171077&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.764368&lon=20.254933&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.45&lon=5.3&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=29.001726&lon=-13.611669&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=16.25&lon=-92.133333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=30.508017&lon=105.573324&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.0667&lon=120.7347&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.962826&lon=120.637713&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=25.5972222&lon=-80.3808333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=35.3333333&lon=25.0666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.168333&lon=132.766944&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=55.59575&lon=11.861583&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=18.550278&lon=72.927778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.607778&lon=-90.803056&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.666667&lon=-103.85&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-28.410979&lon=26.701068&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=34.0005556&lon=-81.035&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=34.916667&lon=137.15&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=25.516667&lon=91.266667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.75&lon=23.616667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-13.9666667&lon=28.6833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.266667&lon=21.633333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-25.366667&lon=-55.8&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.6569444&lon=6.2336111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.266667&lon=27.633333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-3.4919444&lon=31.9638889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-6.7666667&lon=38.9166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=25.4683333&lon=-80.4777778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.6105556&lon=-72.9730556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=21.1&lon=-89.416667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=52.384479&lon=5.799894&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.633333&lon=10.033333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=37.7477778&lon=-84.2947222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=56.065579&lon=12.285119&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=56.634457&lon=69.818913&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.135&lon=45.4363889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=54.890164&lon=32.431113&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=6.151641&lon=6.844585&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.866667&lon=9.183333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.04556&lon=121.077218&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=42.8719444&lon=18.4297222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-13.8166667&lon=-171.8&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=36.726666&lon=-4.434802&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.0166667&lon=-87.15&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.733333&lon=92.05&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.033333&lon=122.883333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=12.1679&lon=125.4503&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=28.433333&lon=74.483333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=42.0427778&lon=-88.0797222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.927226&lon=8.734619&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=24.516667&lon=-104.783333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=25.283333&lon=80.566667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.1797222&lon=-76.1791667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=56.7195&lon=60.7833&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=35.233333&lon=137.1&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.233333&lon=24.15&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.7318&lon=120.2781&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=37.7333333&lon=23.95&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=54.3&lon=110.3&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.967395&lon=0.158067&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=8.4833333&lon=-82.7833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=23.633333&lon=-103.65&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=7.7161&lon=123.3219&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.589722&lon=11.003889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=34.092222&lon=74.802222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=39.7583333&lon=22.5786111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.583333&lon=-68.183333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.005301&lon=-8.591953&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.0471&lon=120.7509&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=57.040959&lon=65.720179&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=30.5705556&lon=-97.4091667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.1341667&lon=15.8586111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=56.189328&lon=47.219877&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=10.8925&lon=124.955833&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=10.057&lon=123.4361&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=33.9166667&lon=-117.8991667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=8.5&lon=-82.7166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=12.3166667&lon=-2.4666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-15.283333&lon=-49.583333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.575706&lon=24.700269&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.1664&lon=121.0397&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=35.516667&lon=140.083333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.5255556&lon=5.9405556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.85&lon=28.083333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.5&lon=-4.2&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=57.083333&lon=-4.05&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=20.083333&lon=-99.216667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=38.9333333&lon=23.0666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=9.140109&lon=99.333114&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=54.370833&lon=92.135833&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.55&lon=9.3&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.4428&lon=120.8231&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=59.666667&lon=10.8&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=6.468382&lon=-73.260224&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.838258&lon=32.761155&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.716667&lon=22.05&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-22.95&lon=-47.016667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-5.85&lon=34.95&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.166667&lon=24.533333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=54.666667&lon=-6.25&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=58.1452778&lon=25.0441667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-13.8333333&lon=-171.8166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.39646&lon=8.448587&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.2981&lon=103.3097&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=0.9833333&lon=9.6&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-1.45&lon=-79.7333333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.038333&lon=21.4925&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.758&lon=129.523&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.666667&lon=24.0&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.983333&lon=142.966667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.5894444&lon=-89.2888889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.1027778&lon=-6.065&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=36.25&lon=27.9666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-18.15&lon=-63.8666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=27.366667&lon=79.633333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=18.666667&lon=78.116667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.662778&lon=20.93&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.382631&lon=27.630511&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=9.583333&lon=76.516667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.3399&lon=19.746478&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.0184&lon=122.9295&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.428333&lon=12.0725&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.816667&lon=9.866667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.466051&lon=120.452732&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-1.033333&lon=103.583333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=38.6666667&lon=21.3166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.7&lon=10.766667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=25.533333&lon=-103.25&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-2.468333&lon=28.824167&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=9.516667&lon=78.1&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=35.3394444&lon=-97.4863889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-10.133333&lon=-36.166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-25.2&lon=-49.366667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=19.539444&lon=-99.400833&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.116667&lon=7.4&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-28.233333&lon=-48.666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=58.633333&lon=6.1&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-9.0833333&lon=143.2&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=31.315&lon=-85.8552778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.3&lon=16.066667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-18.783333&lon=-42.95&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-34.003333&lon=24.731417&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.966667&lon=-91.766667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=57.583333&lon=-2.183333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-1.833333&lon=-44.866667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.933333&lon=26.55&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.2274&lon=123.5101&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=5.815278&lon=125.226667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=8.15&lon=-81.1833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.566667&lon=-80.85&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-20.0430556&lon=57.5786111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=34.7694444&lon=-92.2669444&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=30.07537&lon=71.192129&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=37.7808333&lon=-90.4216667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.716667&lon=-75.05&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=39.0416667&lon=-94.72&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=56.349073&lon=53.124392&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-26.214953&lon=28.254732&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=33.1&lon=129.983333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.283333&lon=8.566667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-11.633333&lon=-42.033333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-24.883333&lon=28.283333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.9&lon=25.366667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=7.8654&lon=123.5123&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=25.8627778&lon=-80.1930556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.492985&lon=2.96826&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=28.133333&lon=77.55&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.5&lon=5.416667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=57.05&lon=22.5833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-29.95&lon=-51.083333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.3227778&lon=-76.4175&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.416667&lon=24.716667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=8.186032&lon=124.162765&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.85&lon=-97.066667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.383333&lon=10.133333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=19.333333&lon=-96.3&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=54.905556&lon=70.443889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=11.4166667&lon=-9.1666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=22.3119444&lon=-79.6533333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.111667&lon=20.621389&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.516667&lon=73.75&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.416667&lon=21.166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.1333333&lon=63.45&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.166667&lon=8.566667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.6&lon=116.633333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-3.55&lon=-40.65&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-5.15&lon=38.9833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.0138889&lon=44.4858333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=32.8422222&lon=-104.4027778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-11.016667&lon=-37.2&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=34.1283333&lon=-117.2077778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.718056&lon=42.903611&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=58.457577&lon=49.286671&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=38.3130556&lon=69.0430556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-7.516667&lon=-35.316667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=39.133333&lon=16.066667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=54.88314&lon=56.874172&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=27.566667&lon=95.566667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.833333&lon=26.066667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-37.083333&lon=-72.566667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=35.4844444&lon=24.0744444&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.583333&lon=5.066667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.611111&lon=77.516667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=33.577778&lon=9.014722&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=24.683333&lon=78.416667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.2411&lon=15.491409&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=27.366667&lon=95.316667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=6.438088&lon=-75.331355&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=33.733333&lon=130.466667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=37.9358333&lon=-122.3466667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.610423&lon=18.510703&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=37.9577778&lon=-121.2897222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.748391&lon=3.156756&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=7.116667&lon=124.4&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.4&lon=6.916667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=52.355&lon=-7.7038889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.6967&lon=54.2642&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-13.8166667&lon=-171.7833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.9458333&lon=-81.4833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.600381&lon=7.787355&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.8011111&lon=-88.0747222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=18.3&lon=73.25&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=52.3&lon=11.416667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=52.052902&lon=15.100955&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.316667&lon=4.433333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.267573&lon=3.907652&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=42.2625&lon=-71.8027778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=42.4527778&lon=-75.0641667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-11.3&lon=35.0333333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-5.7&lon=34.4833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.450776&lon=41.038657&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=7.231271&lon=124.324722&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-9.55&lon=33.95&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.000556&lon=76.099444&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.7444444&lon=-68.8375&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=63.1&lon=7.816667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.574087&lon=2.582871&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.3&lon=24.15&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=37.9833333&lon=22.9666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=55.3175&lon=42.174444&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.7955556&lon=44.2783333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.735474&lon=13.757592&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=29.7055556&lon=-95.4586111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=20.2977778&lon=-76.2413889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.2&lon=4.766667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-5.0605556&lon=31.7936111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=4.719295&lon=-74.929181&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.966667&lon=7.866667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.366667&lon=9.15&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=16.0188889&lon=-16.4952778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.225833&lon=-90.474167&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.416667&lon=16.166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=8.05&lon=4.766667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-4.3&lon=-38.483333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=6.210556&lon=124.189444&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-28.3&lon=-53.5&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.336326&lon=40.295881&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.766667&lon=-92.266667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.016667&lon=-77.15&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.167222&lon=48.700556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.195798&lon=102.07145&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=37.4136111&lon=-79.1425&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=27.0666667&lon=89.5833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.6408333&lon=-89.1333333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=55.8703&lon=41.7641&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=11.233333&lon=77.5&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=52.0712&lon=84.107&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=39.0169444&lon=-94.2813889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=38.1666667&lon=22.3333333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.761319&lon=-3.339652&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=34.213903&lon=71.555226&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.532222&lon=49.716389&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.466667&lon=25.383333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=33.0144444&lon=-97.0966667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-34.183333&lon=-70.666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.343865&lon=46.854111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.62609&lon=17.733761&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.968436&lon=17.584023&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=30.2452778&lon=-85.6483333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.033333&lon=-73.433333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.159897&lon=4.617757&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-9.35&lon=28.7333333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=39.1230556&lon=-93.1966667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=6.227222&lon=125.120833&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.55&lon=7.916667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.9&lon=23.166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-22.8666667&lon=26.5&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=20.2013889&lon=1.0088889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=31.72&lon=72.978889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.329979&lon=17.577216&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.8587&lon=120.6215&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.2133333&lon=-77.58&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=31.559777&lon=118.482888&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.9869444&lon=10.27&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=35.4736111&lon=-81.2547222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=57.728604&lon=61.249558&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=52.100406&lon=6.646741&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.433333&lon=10.95&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=60.199679&lon=29.701834&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=55.9666667&lon=23.8666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=42.0772222&lon=-71.63&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.6514&lon=117.5599&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.431389&lon=37.955&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=61.6&lon=-6.95&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.966667&lon=26.083333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=36.750498&lon=-3.873931&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.388889&lon=21.224444&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=4.528969&lon=-73.922727&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=11.6636111&lon=-1.0730556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.065128&lon=-8.585315&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=57.108539&lon=10.022151&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.685679&lon=2.882139&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.3983333&lon=-81.8047222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.7&lon=14.483333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=21.633333&lon=69.6&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-20.2261111&lon=57.7361111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=39.4666667&lon=22.0833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-7.834722&lon=110.685556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.519225&lon=17.50802&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=38.1411111&lon=-85.6877778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=5.9749&lon=116.0724&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=11.8&lon=77.8&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.016667&lon=20.833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.583333&lon=9.216667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-33.56668&lon=18.483348&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.529167&lon=-90.184167&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.425675&lon=38.658239&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=55.735649&lon=12.151579&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.2548&lon=121.1366&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.520982&lon=40.079525&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-24.65&lon=-56.433333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-7.866667&lon=-35.45&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.316667&lon=20.816667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=55.721114&lon=11.465466&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.834444&lon=21.744167&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.5439&lon=120.7634&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-39.933333&lon=175.05&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=16.1909&lon=119.7802&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=38.216667&lon=15.633333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.156174&lon=122.337487&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.966667&lon=28.083333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.5&lon=27.816667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.93&lon=120.582222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.8341667&lon=16.9888889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-29.933333&lon=-51.183333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=52.118856&lon=21.308008&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-16.666667&lon=-49.266667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-0.193368&lon=-74.781886&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-14.0&lon=-171.4&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.8666667&lon=-61.1166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.633333&lon=7.9&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=16.085316&lon=120.031636&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=8.0377778&lon=-72.2519444&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.5455&lon=40.7933&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=18.033333&lon=78.433333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.2333333&lon=14.1666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.455052&lon=120.413032&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-8.419151&lon=20.744655&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=22.7675&lon=-81.5675&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-22.1&lon=-65.6&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=36.953889&lon=118.104722&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=42.8&lon=23.35&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=10.4666667&lon=-66.8277778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-25.2&lon=-50.95&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=28.7&lon=78.783333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=38.8752778&lon=-76.8886111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=55.540213&lon=9.767479&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.75&lon=24.266667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.573209&lon=0.473389&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=5.662222&lon=125.461667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.621852&lon=13.60102&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.5666667&lon=-15.6&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.885&lon=-87.7844444&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=5.4833333&lon=-53.2166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-3.9&lon=-42.7&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=63.183333&lon=14.65&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.9588889&lon=22.5130556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.346944&lon=44.6975&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=10.2833333&lon=-61.4666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=60.183333&lon=11.266667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=17.666667&lon=-96.133333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.112082&lon=5.870914&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.5980556&lon=22.5566667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.216667&lon=10.1&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=16.868696&lon=102.566422&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=12.968889&lon=79.948889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=42.6505556&lon=18.0913889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=17.25&lon=-99.566667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-3.266667&lon=-44.616667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=32.8341667&lon=-97.2286111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.34407&lon=22.117621&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-5.933333&lon=29.2&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=38.7297222&lon=-120.7975&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-6.8333333&lon=36.9833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=5.381365&lon=100.389691&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.066667&lon=3.266667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.6127778&lon=-89.4591667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.938212&lon=35.158002&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.812603&lon=26.129022&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=9.4442&lon=123.1657&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.03398&lon=19.209353&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.183333&lon=3.0&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.666667&lon=15.116667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=38.3&lon=21.7833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.933333&lon=-96.066667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=27.7166667&lon=85.3166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=10.9768&lon=123.1682&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.966667&lon=26.783333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.600714&lon=17.040233&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.3132&lon=121.0576&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-10.916667&lon=-37.066667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-19.833333&lon=-40.366667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.7841&lon=82.3116&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=10.313441&lon=9.843273&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.343889&lon=49.969167&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=56.1&lon=38.133333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.45&lon=-87.55&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-12.666667&lon=-39.1&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=2.183333&lon=22.466667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.366667&lon=5.016667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.45&lon=23.566667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.266667&lon=7.183333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=18.4166667&lon=-70.1&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=4.953336&lon=-77.365975&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=37.7975&lon=-121.215&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=39.4516667&lon=21.4905556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.957387&lon=18.03714&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=29.45&lon=74.083333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=33.7644444&lon=-117.7930556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-16.0666667&lon=35.1333333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.8&lon=16.666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=24.633333&lon=79.5&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.45&lon=25.85&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.0336111&lon=44.1738889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=58.3863889&lon=26.5466667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.387171&lon=3.114902&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.5512&lon=120.8147&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.4441667&lon=-87.92&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-6.25&lon=-38.916667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=27.666667&lon=80.466667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.8955556&lon=26.17&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.983333&lon=8.8&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-15.2&lon=-59.366667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=18.2833333&lon=-70.3333333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.116667&lon=9.833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.1704&lon=120.9903&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=64.85&lon=11.6&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=12.4355556&lon=-86.8794444&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-11.7&lon=-41.466667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.052222&lon=20.430278&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=37.383333&lon=14.7&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=22.166667&lon=75.35&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=31.0775&lon=75.337222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.25&lon=27.933333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=10.124722&lon=124.884167&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.633333&lon=27.8&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-6.9375&lon=109.1325&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.409314&lon=21.932665&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.15&lon=3.133333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.216667&lon=80.316667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-21.2666667&lon=55.5166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.284722&lon=5.918611&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.909659&lon=33.380438&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.833333&lon=20.65&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.490278&lon=19.74&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=58.412719&lon=51.27819&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=28.816667&lon=79.033333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=21.733333&lon=72.066667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.2&lon=22.2&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-36.121792&lon=146.888092&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.683333&lon=10.85&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.0663889&lon=-8.8166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=30.167456&lon=120.258831&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=22.483333&lon=86.716667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=37.0666667&lon=21.6333333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.8&lon=12.6&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-16.0833333&lon=-69.6666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.85&lon=20.233333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=52.066667&lon=9.616667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=42.5997222&lon=-71.3677778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.0349&lon=121.4312&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=20.3&lon=-89.416667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-10.766667&lon=-37.316667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=31.6544444&lon=-106.3027778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=25.766667&lon=-108.966667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=52.466667&lon=-2.133333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-3.85&lon=-40.933333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-26.5666667&lon=31.1833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-7.6899&lon=112.2709&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=39.9522222&lon=-75.1641667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=58.1677778&lon=26.9286111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.6833333&lon=-87.3166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.677001&lon=18.679329&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=52.825438&lon=34.499604&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.5333333&lon=-61.0333333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.4833333&lon=-60.9&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=54.4253&lon=119.9327&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-9.966667&lon=-37.083333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.631667&lon=12.569444&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=55.9&lon=-2.733333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=54.942621&lon=39.023819&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.633333&lon=-111.916667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-17.85&lon=-42.85&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=55.702674&lon=37.383217&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.963116&lon=17.03136&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-22.4&lon=46.1166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=11.116667&lon=77.8&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=56.39516&lon=38.712161&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=55.678942&lon=47.94396&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.361796&lon=-7.86014&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.666667&lon=-105.466667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=30.233333&lon=75.833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-38.65&lon=-72.233333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=56.7528&lon=61.0468&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=57.439139&lon=42.128943&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=5.717778&lon=125.253611&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-7.056389&lon=107.636667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=11.254486&lon=122.801802&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=5.876376&lon=-73.572843&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.757871&lon=15.311269&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=12.5931&lon=121.5032&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=8.3833333&lon=-82.8666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.833333&lon=11.133333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.233333&lon=-76.483333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.883333&lon=120.6&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.6&lon=23.1&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-20.1936111&lon=57.5722222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=25.533333&lon=81.383333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-9.7833333&lon=29.0833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.6&lon=7.2&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=9.185556&lon=126.170556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.900465&lon=6.638075&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=38.4166667&lon=21.9&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.833333&lon=-64.2&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-20.2566667&lon=57.4061111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.183333&lon=-2.516667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=6.15769&lon=-75.643173&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.684167&lon=-90.644167&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.428924&lon=-8.737462&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=61.75&lon=50.916667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=16.07181&lon=121.049536&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=22.5333333&lon=-80.9061111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.406069&lon=4.981073&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=42.3583333&lon=-71.0602778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.733333&lon=26.983333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-18.75&lon=-40.866667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=2.385&lon=103.021&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.116667&lon=9.4&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=38.083333&lon=13.283333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.4780556&lon=-16.6819444&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=36.1&lon=28.0166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.133333&lon=26.266667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=39.9&lon=-79.7166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=52.6804&lon=52.3635&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.6&lon=-3.783333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=38.8594444&lon=21.1663889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.7&lon=-0.033333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.061944&lon=80.209444&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.733333&lon=7.1&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-25.810153&lon=28.742483&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.166667&lon=27.166667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-7.613282&lon=15.056621&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=53.992812&lon=55.908614&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=9.329079&lon=-74.45302&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.1794444&lon=16.3638889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=27.182752&lon=68.636042&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.95&lon=27.35&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.833056&lon=40.145556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=42.4975&lon=-94.1677778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=22.216667&lon=-97.85&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.783333&lon=23.15&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=56.3816&lon=103.1&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=32.683333&lon=35.8&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=59.000819&lon=57.648561&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-36.8&lon=174.75&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.883333&lon=120.65&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.079485&lon=15.4357&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=7.741035&lon=-73.0483&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=59.966667&lon=23.433333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=35.0844444&lon=-106.6505556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=22.65&lon=86.066667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-2.3905556&lon=40.4530556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.714397&lon=13.207057&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=17.3&lon=96.5833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=26.233333&lon=84.15&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=59.3202778&lon=24.5525&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=34.4&lon=74.283333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=11.8&lon=75.45&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.2&lon=11.883333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=1.7427&lon=98.7792&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.212222&lon=26.303611&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=9.1833333&lon=-79.2666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.941548&lon=-7.433918&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.233333&lon=25.7&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=33.7947222&lon=-83.7133333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.276571&lon=-8.376174&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-29.181858&lon=-58.078951&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=24.433333&lon=74.266667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.636111&lon=131.153889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.335046&lon=19.95276&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.4916667&lon=20.2219444&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.3061111&lon=-71.7705556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.266667&lon=27.25&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=39.069687&lon=-7.69849&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=25.75&lon=75.383333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=38.005&lon=-121.8047222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=52.183333&lon=7.866667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.8988889&lon=-74.0930556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=56.749436&lon=8.419525&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-3.3666667&lon=33.95&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-22.1&lon=-56.516667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=10.386972&lon=123.222701&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=30.266667&lon=76.035&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=12.2666667&lon=-69.1&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=1.935&lon=-78.205&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=52.130695&lon=20.662227&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=4.403056&lon=-74.025278&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-17.268641&lon=145.47522&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=34.261008&lon=-6.580203&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=19.25&lon=-97.783333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.266667&lon=148.5&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=16.0826&lon=120.7359&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=22.8&lon=89.55&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=33.6469444&lon=-117.6883333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.45&lon=3.816667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.022632&lon=18.940556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.467222&lon=44.569167&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.816667&lon=8.65&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.3&lon=9.116667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=55.866667&lon=-3.15&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.845&lon=19.898611&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=17.633333&lon=-99.083333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=39.3752778&lon=21.9752778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=57.4953&lon=60.2112&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.7561111&lon=22.2136111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=59.3347222&lon=26.145&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.25&lon=6.7&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.65&lon=20.666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=5.7333333&lon=19.0833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=64.316667&lon=-22.1&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=33.6258333&lon=-97.1330556&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.5517&lon=120.5163&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.25&lon=-81.766667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-34.583816&lon=-60.943318&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.433333&lon=-81.5&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=55.572529&lon=39.536818&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.15&lon=-55.366667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.8788889&lon=-73.1572222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=19.434167&lon=-99.138611&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=36.133333&lon=139.383333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-11.7333333&lon=24.4333333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=39.3&lon=140.566667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=6.8833333&lon=73.1&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.6855556&lon=5.8786111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.239059&lon=8.725646&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=34.1361111&lon=-117.8644444&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=49.394444&lon=8.596111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=1.533333&lon=103.666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.2474&lon=123.769&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-0.766667&lon=-47.45&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=56.971802&lon=39.768403&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=36.181667&lon=118.158333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=54.988056&lon=35.310833&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=61.903611&lon=129.638333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=28.805&lon=-97.0033333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.2155556&lon=19.9713889&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.5&lon=20.5&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.65&lon=4.566667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=25.433333&lon=81.933333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=42.1625&lon=-71.0416667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.5575&lon=43.850833&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.5186111&lon=-74.4125&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.906872&lon=2.179199&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.0405556&lon=44.0675&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=4.487967&lon=-73.897488&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=3.816667&lon=117.25&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.816667&lon=10.233333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.3691&lon=119.1012&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.41694&lon=9.251252&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-19.833333&lon=-42.316667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.133333&lon=-89.833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.473646&lon=4.525411&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.2344444&lon=-70.81&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=20.133333&lon=85.1&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.253177&lon=36.734685&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.692336&lon=99.849692&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.65&lon=-0.266667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=7.073056&lon=125.612778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=14.9852&lon=120.5589&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=57.116667&lon=8.616667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=56.0594444&lon=24.4036111&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=10.15&lon=-11.95&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=12.7&lon=79.983333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=38.846288&lon=-9.087485&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=47.533333&lon=25.4&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=58.416667&lon=6.633333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=13.7666667&lon=-88.0833333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=43.833333&lon=-80.533333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-1.5&lon=33.8&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.683333&lon=-72.033333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=19.15&lon=-102.033333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=19.4&lon=-98.15&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.383333&lon=0.516667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.233333&lon=22.033333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=10.25&lon=-74.0&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.900882&lon=8.276516&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.5047222&lon=-73.97&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.9948&lon=120.1647&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-6.8048&lon=110.8405&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.036772&lon=35.377892&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=16.00292&lon=120.211536&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=36.9752778&lon=-121.9522222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=4.853142&lon=-74.259955&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.233333&lon=5.116667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=35.725278&lon=139.217778&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=69.383333&lon=178.416667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.442549&lon=46.742399&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=20.233333&lon=-103.583333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=42.783595&lon=46.261709&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=26.2708333&lon=-80.2708333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=26.45&lon=88.133333&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=39.9469444&lon=-75.2925&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=9.54765&lon=-75.311285&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=65.008331&lon=53.911278&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=48.607672&lon=32.983473&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=46.85931&lon=18.164423&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=51.833333&lon=6.7&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.4666667&lon=21.2666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=50.197949&lon=14.354321&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=59.610833&lon=10.405833&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=54.983333&lon=11.9&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.6116667&lon=17.9872222&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-22.216667&lon=-54.8&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=8.2023&lon=123.8582&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=-0.7833333&lon=-80.25&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=54.9749&lon=60.3633&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.05&lon=44.45&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=40.8&lon=16.916667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=15.65&lon=-87.0666667&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=45.211696&lon=36.716092&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=41.9666667&lon=-71.1875&units=imperial&q=
    http://api.openweathermap.org/data/2.5/weather?appid=d9a839f5e4705b2c5398e33286955337&lat=44.3869444&lon=19.1013889&units=imperial&q=



```python
cities_dict = {
    "City": city_name,
    "Temperature (F)": temp,
    "Humidity (%)": humid,
    "Cloudiness (%)": cloud,
    "Wind Speed (mph)": wind,
    "Latitude": lats,
}
cities_data = pd.DataFrame(cities_dict)
cities_data.to_csv('WeatherPy.csv')
cities_data.head()
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
      <th>City</th>
      <th>Cloudiness (%)</th>
      <th>Humidity (%)</th>
      <th>Latitude</th>
      <th>Temperature (F)</th>
      <th>Wind Speed (mph)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Isangel</td>
      <td>88</td>
      <td>99</td>
      <td>-19.55</td>
      <td>81.58</td>
      <td>16.24</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Huandacareo</td>
      <td>40</td>
      <td>48</td>
      <td>19.98</td>
      <td>64.40</td>
      <td>3.36</td>
    </tr>
    <tr>
      <th>2</th>
      <td>San Pedro</td>
      <td>24</td>
      <td>98</td>
      <td>10.80</td>
      <td>81.04</td>
      <td>5.17</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Patitirion</td>
      <td>0</td>
      <td>50</td>
      <td>39.15</td>
      <td>56.35</td>
      <td>13.67</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Zwettl Stift</td>
      <td>76</td>
      <td>87</td>
      <td>48.62</td>
      <td>37.21</td>
      <td>10.54</td>
    </tr>
  </tbody>
</table>
</div>



# Temperature (F) vs. Latitude


```python
plt.scatter(cities_data["Latitude"], cities_data["Temperature (F)"],
            marker="o",alpha = .5, edgecolor = 'black')

plt.title("Temperature (F) vs. Latitude (3/01/2018)")
plt.ylabel("Temperature (F)")
plt.xlabel("Latitude")
plt.grid(True)

plt.savefig('templat.png')

plt.show()
```


![png](output_17_0.png)


# Humidity (%) vs. Latitude


```python
plt.scatter(cities_data["Latitude"], cities_data["Humidity (%)"],
            marker="o", alpha = .5, edgecolor = 'black')

plt.title(" Humidity (%) vs. Latitude (3/01/2018)")
plt.ylabel("Humidity (%)")
plt.xlabel("Latitude")
plt.grid(True)

plt.savefig('humlat.png')

plt.show()
```


![png](output_19_0.png)


# Cloudiness (%) vs. Latitude


```python
plt.scatter(cities_data["Latitude"], cities_data["Cloudiness (%)"],
            marker="o",alpha = .5, edgecolor = 'black')

plt.title("Cloudiness (%) vs. Latitude (3/01/2018)")
plt.ylabel("Cloudiness (%)")
plt.xlabel("Latitude")
plt.grid(True)

plt.savefig('cloulat.png')

plt.show()
```


![png](output_21_0.png)


# Wind Speed (mph) vs. Latitude


```python
plt.scatter(cities_data["Latitude"], cities_data["Wind Speed (mph)"],
            marker="o",alpha = .5, edgecolor = 'black')

plt.title("Wind Speed (mph) vs. Latitude (3/01/2018)")
plt.ylabel("Wind Speed (mph)")
plt.xlabel("Latitude")
plt.grid(True)

plt.savefig('windlat.png')

plt.show()
```


![png](output_23_0.png)

