# == Schema Information
#
# Table name: body_part_sections
#
#  id           :integer          not null, primary key
#  body_part_id :integer
#  title        :string           not null
#  sub_title    :string
#  content      :text             not null
#  image        :string
#  position     :integer          default(0), not null
#  display      :boolean          default(TRUE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe BodyPartSection, type: :model do
  describe "validations" do
    it { should validate_presence_of(:body_part) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:title) }
  end

  describe "associations" do
    it { should belong_to(:body_part).counter_cache }
  end
end
