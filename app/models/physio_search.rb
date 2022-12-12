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
    split_post_code = if post_code.length > 7
      post_code.gsub(' ', '')
    else
      post_code
    end

    Geocoder.coordinates(split_post_code)
  end
end
