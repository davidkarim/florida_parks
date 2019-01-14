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

## Publishing Docker image
Create the Docker image on your local machine:

```
docker build -t florida-parks .
```
Test the Docker image locally:

```
# Test image through bash
docker run --rm -p 3000:3000 -it --entrypoint bash florida-parks:latest
rails server --binding=0.0.0.0

# Test the image fully
docker run --rm -p 3000:3000 florida-parks:latest
```

Publish image to Docker Hub:

```
# Get the image ID
image_id=$(docker images | grep florida-parks | awk -v N=3 '{print $N}')
# Tag the image
docker tag $image_id davidkarim/florida-parks:0.1
# Login to Docker Hub and publish
docker login
docker push <username>/florida-parks
```

## Deploying with Kubernetes
Ensure your kubectl tools are properly communicating with your desired Kubernetes cluster:

```
kubectl get svc
```
Latest changes should be in Docker Hub. Deploy the pods and loadbalancer onto the Kubernetes cluster:

```
# Deploy pods
kubectl apply -f ./web-deploy.yml
# View the deployed pods
kubectl get pods
# Deploy the load balancer service (must be deploying to a cloud service)
kubectl apply -f ./web-lb.yml
# View the services
kubectl get svc
kubectl describe svc web-svc # Public IP shown as LoadBalancer Ingress
```

