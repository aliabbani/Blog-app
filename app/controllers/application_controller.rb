class ApplicationController < ActionController::Base
end

# Create a method called current_user in your ApplicationController.
# A current_user method should return the first user from a database.
# Don't worry about proper authentication at this time. You will add it in the upcoming projects.

def current_user
  User.first
end
