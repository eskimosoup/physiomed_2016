class PhysioSearch
  include ActiveModel::Model

  attr_accessor :post_code

  def results
    Practice.displayed.near(post_code, 20).limit(5)
  end
end
