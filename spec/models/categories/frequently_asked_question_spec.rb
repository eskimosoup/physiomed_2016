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

require 'rails_helper'

RSpec.describe Categories::FrequentlyAskedQuestion, type: :model do
  describe 'associations' do
    it { should belong_to :category }
    it { should belong_to :frequently_asked_question }
  end
end
