# == Schema Information
#
# Table name: categories_frequently_asked_questions
#
#  id                           :integer          not null, primary key
#  category_id                  :integer
#  frequently_asked_question_id :integer
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  position                     :integer          default(0), not null
#

class Categories::FrequentlyAskedQuestion < ActiveRecord::Base
  include OptimadminScopes

  default_scope { order :position }

  belongs_to :category
  belongs_to :frequently_asked_question, class_name: '::FrequentlyAskedQuestion'
end
