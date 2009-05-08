# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_scrabble_session',
  :secret      => 'b8c3793e7563b90d6a73794c3662d72de77670fa1199351d850ce2fa2be2d930d49043525969c98d30e5dc7945e815b1f70c78e5d2651a9f58b11ee1925d84d8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
