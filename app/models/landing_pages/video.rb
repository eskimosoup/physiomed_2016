module LandingPages
  class Video < ActiveRecord::Base
    belongs_to :video
    belongs_to :landing_page
  end
end
