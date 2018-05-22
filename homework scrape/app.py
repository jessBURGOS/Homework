from flask import Flask, render_template, jsonify
from flask_pymongo import PyMongo
import scrape_mars

app = Flask(__name__)

mongo = PyMongo(app) 


@app.route('/')
def index():
    mars = mongo.db.mars.find_one()
    return render_template('index.html', mars=mars)


@app.route('/scrape')
def scrape():
    mars_data= scrape_mars.scrape()
    mars_dict = {
        "featured_image_url": mars_data["featured_image_url"],
        "mars_weather": mars_data["mars_weather"],
        "mars_facts": mars["mars_facts"]
    }

    # Insert forecast into database
    mongo.db.collection.insert_one(mars_dict)

    # Redirect back to home page
    return redirect("http://localhost:5000/", code=302)


if __name__ == "__main__":
    app.run(debug=True)
