# frozen_string_literal: true

Geocoder.configure(
  use_https: true,
  api_key: ENV['GOOGLE_GEOCODER_API_KEY'],
  timeout: 5
)
