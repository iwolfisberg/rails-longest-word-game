# Be sure to restart your server when you modify this file.
Rails.application.config.session_store :cookie_store, key: :score
# Specify a serializer for the signed and encrypted cookie jars.
# Valid options are :json, :marshal, and :hybrid.
Rails.application.config.action_dispatch.cookies_serializer = :json
