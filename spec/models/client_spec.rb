# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  logo       :string           not null
#  slug       :string
#  position   :integer          default(0), not null
#  display    :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe Client, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it do
      client = build(:client)
      expect(client).to validate_uniqueness_of(:name)
    end
    it { should validate_presence_of(:logo) }
  end
end
