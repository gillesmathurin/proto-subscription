# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_proto-subscription_session',
  :secret      => '7fe4e7c8d92d9c3c57b8cd47201f41106e803570089bf2c603c625808fc62ba6d687e9bc3cd2b17a3c5a603a99944186fa1d24780bd5d242e401acb526243ce3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
