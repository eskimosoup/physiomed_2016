# frozen_string_literal: true

Geocoder.configure(
  lookup: :google,
  use_https: true,
  api_key: ENV['PHYSIOMED_GOOGLE_GEOCODER_API_KEY'],
  timeout: 5
)
