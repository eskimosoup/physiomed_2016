module LandingPages
  class Guide < ActiveRecord::Base
    belongs_to :guide
    belongs_to :landing_page
  end
end
