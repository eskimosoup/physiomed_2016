class Categories::FrequentlyAskedQuestion < ActiveRecord::Base
  belongs_to :category
  belongs_to :frequently_asked_question
end
