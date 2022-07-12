# README

## SeQura API - Documentation

Let's Start!

# Behind the curtain
I tried to respect the time slot. The time division was distributed as follows:

The first 2 hours were used to: 
- Study the case and make a UML to interpret the problem. 
- Create the project with the necessary initial dependencies.
- Create the data structure.
- Generate endpoint.
- Configure worker.
- Add validations.

In the last hour: 
- Made the refactor
- Create an api documentation
- Write this readme
- Use serializers
- Write unit tests (which I couldn't finish it due over time).

# Requirements
This project it made with ruby 2.7.0 version.
I used PostgreSQL as a database.

# API Documentation
Visit this URL for more information abount the endpoint -> https://documenter.getpostman.com/view/16208664/UzJQqEqm

# Run project
Now, to be able to run the project we need:

1) Clone the repository or use a fork.
2) Install the dependencies `bundle install`
3) Run migrations and populate database with `rails db:migrate db:populate`
4) Run server with `rails s`
5) For execute workers we need up Redis and Sidekiq on separeted terminal with `redis-server` and `bundle exec sidekiq`
6) From rails console `rails c` we can execute the worker with `ExecuteDisbursementsWorker.new.perform`

# Missing Tasks
- Do unit tests of the models, requests and workers (The suite is configurated with RSpec but, I couldn't finish it in time).
- Add more validations to model fields.
- Add pipelines to automate the tasks like as rubocop, rspec and, if necessary, a deploy.
- Use cases to centralize from business to programming logic and make the controllers smaller (maybe it was not the case but I wanted to show it).
- Use an error handler.
- General refactoring.
- Configure Capistrano for deploy to server and configure cron tab.
- Add Authentication on requests.
- Add HTTP status response on endpoint.
- Review if exists n+1 problem.
- Use json data from challenge for mocks on testing.
