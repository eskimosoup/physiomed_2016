# == Schema Information
#
# Table name: landing_pages_sections
#
#  id              :integer          not null, primary key
#  landing_page_id :integer
#  title           :string           not null
#  sub_title       :string
#  content         :text
#  image           :string
#  position        :integer          default(0), not null
#  display         :boolean          default(TRUE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  style           :string           default("basic"), not null
#

require 'rails_helper'

RSpec.describe LandingPages::Section, type: :model do
  describe "validations" do
    it { should validate_presence_of(:landing_page) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:title) }
  end

  describe "associations" do
    it { should belong_to(:landing_page).counter_cache }
  end
end
