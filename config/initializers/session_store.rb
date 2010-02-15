# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mp3Parser_web_session',
  :secret      => '44b9c1d2813b806d005a0172a16e05020e37da6121275551297f5363ce6347779ce0c0b06fe9dabbb42d586eb839f32462bea10312d12310eb8d54f89cf08459'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
