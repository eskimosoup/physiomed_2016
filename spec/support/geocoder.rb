Geocoder.configure(lookup: :test)

Geocoder::Lookup::Test.set_default_stub(
  [
    {
      'latitude' => 53.7457,
      'longitude' => 0.3367,
      'address' => "Hull, United Kingdom",
      'country' => "United Kingdom",
      "country_code" => "GB"
    }
  ]
)
