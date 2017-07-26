module LandingPages
  class Article < ActiveRecord::Base
    belongs_to :article
    belongs_to :landing_page
  end
end
