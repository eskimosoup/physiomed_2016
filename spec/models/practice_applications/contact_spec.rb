# == Schema Information
#
# Table name: practice_applications_contacts
#
#  id          :integer          not null, primary key
#  practice_id :integer
#  name        :string           not null
#  position    :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe PracticeApplications::Contact, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :position }
  end
end
