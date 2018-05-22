
import pandas as pd
from bs4 import BeautifulSoup as bs
from splinter import Browser as browser




def init_browser():
    executable_path = {'executable_path': '/usr/local/bin/chromedriver'}
    return browser('chrome', **executable_path, headless=False)


def scrape():
    browser = init_browser()
    mars ={}
    
    #marsimage
    url = 'https://www.jpl.nasa.gov/spaceimages/?search=&category=Mars'
    browser.visit(url)

    html = browser.html
    soup = bs(html, 'html.parser')


    image = browser.find_by_id('full_image')
    image.click()

    browser.is_element_present_by_text('more info', wait_time=1)
    more_info_elem = browser.find_link_by_partial_text('more info')
    more_info_elem.click()

    html = browser.html
    soup = bs(html, 'html.parser')
    image_find = soup.find('figure', class_='lede').find('img')['src']


    featured_image_url = f"https://www.jpl.nasa.gov/{image_find}"
    mars["featured_image_url"] = featured_image_url
    

    # Mars Weather
    url2 = 'https://twitter.com/marswxreport?lang=en'
    browser.visit(url2)

    html = browser.html
    soup = bs(html, 'html.parser')


    mydivs = soup.findAll("p", {"class": "TweetTextSize TweetTextSize--normal js-tweet-text tweet-text"})
    mars_weather = mydivs[0].text

    mars['mars_weather']=mars_weather


    # Mars Facts
    url3 = 'https://space-facts.com/mars/'
    tables = pd.read_html(url3)


    df = tables[0]
    df.columns = ['Details', 'Values']
    df.set_index('Details', inplace=True)
    # html_table = df.to_html()
    # html_table.replace('\n', '')
    
    mars['mars_facts']=df

    return mars

