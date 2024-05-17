# README

To run this application do the following:

* Get a key from openweathermap.org by registering an account (you can borrow mine for viewing by asking via email, I just don't want to post it publically)
* Start your local postgres instance
* Ensure the proper ruby and rails are installed (3.2.2 and 7.1.3.2, respectively)
* bundle install
* rails db:create
* rails db:migrate
* OPEN_WEATHER_KEY=YOUR_KEY bundle exec rails s
* View at http://localhost:3000