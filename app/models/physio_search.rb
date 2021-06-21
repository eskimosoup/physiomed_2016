class PhysioSearch
  include ActiveModel::Model

  attr_accessor :post_code

  def location
    Geocoder.search(coordinates)
  end

  def results
    Practice.displayed.near(coordinates, 20).limit(7)
  end

  private

  def coordinates
    Geocoder.coordinates(post_code)
  end
end
