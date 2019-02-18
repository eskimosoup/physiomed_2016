# == Schema Information
#
# Table name: job_listings
#
#  id                     :integer          not null, primary key
#  title                  :string           not null
#  summary                :text
#  description            :text             not null
#  display_from           :date             not null
#  display_until          :date             not null
#  display                :boolean          default(TRUE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  job_applications_count :integer          default(0)
#

require 'rails_helper'

RSpec.describe JobListing, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :display_from }
    it { should validate_presence_of :display_until }
  end
end
