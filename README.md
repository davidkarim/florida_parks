# README

[![Build Status](http://jenkins.dkarim.com/job/florida_parks_build/badge/icon)](http://jenkins.dkarim.com/job/florida_parks_build)

This Rails app demonstrates the concept of web scraping. The app is meant to be an easier way to view Florida Parks information. The information is gathered through a scraper. The scraper is initiated via a rake task located [here](lib/tasks/scrape.rake). To run the app:

* Clone the repo

* Run `bundle install` to install the necessary gems

* Create the database (app currently uses sqlite3): `rake db:migrate`

* Run the rake task that scrapes and populates the database: `rake scrape:fl_parks`

* Run the Rails server and visit localhost:3000

* Pending items: add additional parks, increase test coverage, searching through AJAX
.
