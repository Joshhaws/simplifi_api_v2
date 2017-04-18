# README

This is the API code for simplifiapi, this api provides all of the endpoints and backend logic to integrate with the simplifi ios app, as well as the simplifif web app.

To run this project locally the api requires:

- Install ruby and rails
- Install mysql, and create database named simplifi_development_v2
- Once you've cloned the repo on to your local system run bundle install to install the dependencies from the gemfile, you need to run "bundle install" in the terminal while in the path of the project.
- While navigated to the project directory you will also need to run "rake db:migrate" in order to create the database scheme in the database that you created earlier.
- Enter the commdand "rails s" to start the rails server that will host the api locally
- You can visit the api at localhost:3000

You can go ahead and test this api using postman with the different endpoints outlined in the config/routes file in the project.

# API endpoint
The API is currently live on:
https://simplifiapi2.herokuapp.com

# API Documentation
The API documentations is available at:
https://documenter.getpostman.com/collection/view/1530069-efc7ca15-953f-742c-2076-737b29bdba56
