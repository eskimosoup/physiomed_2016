module LandingPages
  class FrequentlyAskedQuestion < ActiveRecord::Base
    belongs_to :frequently_asked_question
    belongs_to :landing_page
  end
end
