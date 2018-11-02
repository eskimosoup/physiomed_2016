# == Schema Information
#
# Table name: practices
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  address    :string
#  town       :string
#  county     :string
#  post_code  :string           not null
#  latitude   :float
#  longitude  :float
#  display    :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe Practice, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:post_code) }
  end
end
