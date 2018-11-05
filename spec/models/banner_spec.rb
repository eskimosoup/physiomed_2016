# == Schema Information
#
# Table name: banners
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  image      :string           not null
#  position   :integer          default(0), not null
#  display    :boolean          default(TRUE), not null
#  summary    :text
#  link       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe Banner, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image) }
  end
end
