# README

This Rails app demonstrates the concept of web scraping. The app is meant to be an easier way to view Florida Parks information. The information is gathered through a scraper. The scraper is initiated via a rake task. To run the app:

* Clone the repo

* Run `bundle install` to install the necessary gems

* Create the database: `rake db:migrate`

* Run the rake task that scrapes and populates the database: `rake scrape:fl_parks`

* Pending items: test suite, searching through AJAX
