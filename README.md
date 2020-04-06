# Set Up

Run in your console:
- bundle install
- bunlde exec rails db:setup
- bunlde exec rails s
- make API calls to localhost:3000 (I used postman)

Run bundle exec rspec spec to check out unit tests

# Notes
  1. Not creating "un"-like and "un"-dislike functionality for now, 'cause it's not a requirement.
  To do so, I think, I'd add a 'rollback' reaction to UserPostReactionsService. And destroy
  UserPostReaction record with matched reaction

  2. liked_by? and likes_count methods in post.rb are actually triggering n+1 query because of the
  simplified query and the nature of serializers. I decided to leave it as is for now because it doesn't
  matter for this app and using pagination makes it not so bad for bigger apps where at some point(too many likes)
  using includes with sorting over these arrays in ruby.
  If this app is meant to grow the solution is to write raw "custom" SQL and fetch posts with necessary counts
  directly using sql and subqueries. Please let me know if this is necessary at this point and I will happily fix it.

# Docs
  See api_doc.yml for endpoints documentation
