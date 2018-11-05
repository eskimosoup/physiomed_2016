# == Schema Information
#
# Table name: job_applications
#
#  id             :integer          not null, primary key
#  job_listing_id :integer
#  name           :string           not null
#  telephone      :string
#  email          :string           not null
#  cv             :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :telephone }
    it { should validate_presence_of :cv }
  end
end
