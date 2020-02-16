# README

## This project is built using the following 
- Ruby 2.5.6
- Rails 6.0.2
- Postgresql 10.5

This application is hosted on Heroku
`https://stark-mountain-79673.herokuapp.com/`

## To setup the application locally 
1. git clone git@github.com:StephenVarela/clock-in-out.git
2. run bundle install to install all missing gem dependencies 
3. run `bundle exec rake db:create` this creates the local development and test database
4. run `bundle exec rake db:migrate` this runs all pending migrations 

To run test suite
- run `bundle exec rspec spec` 

To serve application in a browser
- run `rails s` to start up the server and visit it at localhost:3000

## Questions
### How did you approach the challenge?
- I started out by first choosing a schema design to get an MVP 
- Generated a user model scaffold to provide CRUD functionality for the user model
- Worked on implementing basic login and logout using bcrypt and sessions controllers
- Created the timecard model controller and views to provide time_card CRUD functionality
- Fixed up site navigation
- Added CSS 
- Added RSpec and FactoryBot for testing

### What schema design did you choose and why?
- I chose to have a single user model and a time_card model
  - A user has many time cards / time_card belongs to a user
- This allows each user to be tied to many time cards allowing them to clock in / out any number of times
- Users clock in and clock outs will be tied to them and can be easily summed up for the use case of 'How many hours did a user clock in'
- Separate user model would also facilitate the ability to provide authentication and authroization per user
- The schema was simple and served the purpose for an MVP and allows for the ability to scale the following features
  - User roles i.e employees vs administrators etc could be tied to user models to allow/disallow access to certain features
  - Time cards could be modified to add additional functionality and would be self contained

### If you were given another day how would you spend it?
- Fixup CSS and views
  - Refactor views to use common components better
  - Better display of warnings spacing of buttons etc
- Add more tests 
  - more controller request specs

### What if I had another Month?
- Split the rails app from the front end
  - Working with a javascript front-end frame work would allow for significant UI/UX improvements
* Rails code would serve as a full API 
  - Switch to devise for more customization of authentication
  - Use cancancan for user authorization based on various user roles
  - Use FastJsonApi for serializing json responses for the front end
  - Setup CI and deployment scripts
  - As an Idea this API could be refactored to be packaged as a rails gem to provide clock in and clock out functionality 
* Attempt to build a simple front-end application to interface with the rails application
* Dockerize both the front-end and back-end applications 
