require "rails_helper"

describe Testimonial, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:content) }
  end

  describe "associations" do
    it { should belong_to(:case_study) }
  end
end
