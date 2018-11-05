# == Schema Information
#
# Table name: landing_pages_frequently_asked_questions
#
#  id                           :integer          not null, primary key
#  frequently_asked_question_id :integer
#  landing_page_id              :integer
#  display                      :boolean          default(TRUE), not null
#  position                     :integer          default(0), not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

require 'rails_helper'

RSpec.describe LandingPages::FrequentlyAskedQuestion, type: :model do
  describe 'validations' do
    it { should belong_to :landing_page }
    it { should belong_to :frequently_asked_question }
  end
end
