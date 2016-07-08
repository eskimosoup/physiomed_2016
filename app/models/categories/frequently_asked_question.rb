class Categories::FrequentlyAskedQuestion < ActiveRecord::Base
  include OptimadminScopes

  default_scope { order :position }

  belongs_to :category
  belongs_to :frequently_asked_question, class_name: '::FrequentlyAskedQuestion'
end
