# README

## SeQura API - Documentation

Let Start!

# Behind the curtain
I tried to respect the time slot and the time division was distributed as follows:

The first 2 hours I used to study the case and make a UML to interpret the problem well as well as create the project with the initial gems that I was going to need and the data modeling.

I also used the time to create the endpoint, the worker that should run every Monday, and validations.

The last hour I left to refactor, create an api documentation, write this readme and write unit tests which I couldn't get to over time.

# Requirements
This project it made with ruby 2.7.0 version.
I used a database with PostgreSQL.

# API Documentation
Visit this URL for more information abount the endpoint -> https://documenter.getpostman.com/view/16208664/UzJQqEqm

# Run project
Now yes, to be able to run the project we need:

1) Clone the repository or use a fork
2) Install the dependencies `bundle install`
3) Run migrations and populate database with `rails db:migrate db:populate`
4) Run server with `rails s`
5) For execute workers we need up Redis and Sidekiq on separeted terminal with `redis-server` and `bundle exec sidekiq`
6) From rails console `rails c` we can execute the worker with `ExecuteDisbursementsWorker.new.perform`

# Missing Tasks
- Do unit tests of the models, requests and workers (The suite got set up but I didn't get there in time)
- Add more validations to model fields
- Add pipelines to automate the tasks of rubocop, rspec and, if necessary, a deploy
- Use use cases to centralize business logic programming logic and make controllers smaller (maybe it was not the case but I wanted to show it)
- Use an error handler
- General refactoring
- Configure Capistrano for deploy to server and configure cron tab
- Add Authentication on requests
- Add HTTP status response on endpoint
- Review if exists n+1 problem
- Use json data from challenge for mocks on testing
