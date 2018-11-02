# == Schema Information
#
# Table name: quick_links
#
#  id         :integer          not null, primary key
#  link       :string           not null
#  link_text  :string           not null
#  position   :integer          default(0), not null
#  display    :boolean          default(TRUE), not null
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe QuickLink, type: :model do
  describe "validations" do
    it { should validate_presence_of(:link) }
    it { should validate_presence_of(:link_text) }
  end

  context "employer quick link" do
    it "#employer?" do
      quick_link = build(:employer_quick_link)

      expect(quick_link.employer?).to eq(true)
    end

    it "#employee?" do
      quick_link = build(:employer_quick_link)

      expect(quick_link.employee?).to eq(false)
    end
  end

  context "employee quick link" do
    it "#employer?" do
      quick_link = build(:employee_quick_link)

      expect(quick_link.employer?).to eq(false)
    end

    it "#employee?" do
      quick_link = build(:employee_quick_link)

      expect(quick_link.employee?).to eq(true)
    end

  end
end
