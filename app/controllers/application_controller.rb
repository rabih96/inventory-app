class ApplicationController < ActionController::Base
  # Added to make forms work with replit.com
  # This disables authentication, only added for demo purposes
  protect_from_forgery with: :null_session
end
