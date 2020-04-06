# Set Up

Run in your console:
- bundle install
- bunlde exec rails db:setup
- bunlde exec rails s
- make API calls to localhost:3000(I used postman)

Run bundle exec rspec spec to check out unit tests

# Notes
  Not creating "un"-like and "un"-dislike functionality for now, 'cause it's not a requirement.
  To do so, I think, I'd add a 'rollback' reaction to UserPostReactionsService. And destroy
  UserPostReaction record with matched reaction

# Docs
  See api_doc.yml for endpoints documentation
