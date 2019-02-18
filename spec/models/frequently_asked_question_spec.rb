# == Schema Information
#
# Table name: frequently_asked_questions
#
#  id         :integer          not null, primary key
#  question   :string           not null
#  answer     :text             not null
#  display    :boolean          default(TRUE), not null
#  position   :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe FrequentlyAskedQuestion, type: :model do
  describe "validations" do
    it { should validate_presence_of(:answer) }
    it { should validate_presence_of(:question) }
  end

  describe 'assoications' do
    it { should have_many(:categories_frequently_asked_questions).class_name("Categories::FrequentlyAskedQuestion") }
    it { should have_many(:categories).through(:categories_frequently_asked_questions) }
  end
end
