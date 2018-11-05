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

module LandingPages
  class FrequentlyAskedQuestion < ActiveRecord::Base
    belongs_to :frequently_asked_question
    belongs_to :landing_page
  end
end
