# README

[![Build Status](https://circleci.com/gh/davidkarim/florida_parks.svg?style=shield&circle-token=f7b46a2470d521e17a5d1843e77c6d96fac4d1ad)](https://circleci.com/gh/davidkarim/florida_parks.svg?style=shield&circle-token=f7b46a2470d521e17a5d1843e77c6d96fac4d1ad)

This Rails app demonstrates the concept of web scraping. The app is meant to be an easier way to view Florida Parks information. The information is gathered through a scraper. The scraper is initiated via a rake task located [here](lib/tasks/scrape.rake). To run the app:

* Clone the repo

* Run `bundle install` to install the necessary gems

* Create the database (app currently uses sqlite3): `rake db:migrate`

* Run the rake task that scrapes and populates the database: `rake scrape:fl_parks`

* Run the Rails server and visit localhost:3000

* Pending items: add additional parks, increase test coverage, searching through AJAX

Changes that are pushed to GitHub are automatically built and tested with Circle-CI.
