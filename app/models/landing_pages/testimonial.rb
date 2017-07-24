module LandingPages
  class Testimonial < ActiveRecord::Base
    belongs_to :testimonial
    belongs_to :landing_page
  end
end
