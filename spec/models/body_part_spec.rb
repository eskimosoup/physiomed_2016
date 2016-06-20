require 'rails_helper'

RSpec.describe BodyPart, type: :model do
  describe "validations" do
    it { should validate_presence_of(:category) }
    it do
      category = create(:category, name: "Lower Leg")
      body_part = build(:body_part, category: category) 
      expect(body_part).to validate_uniqueness_of(:category_id)
    end
  end

  describe "associations" do
    it { should belong_to(:category) }
    it { should have_one(:people_helped_section).through(:category) }
    it { should have_many(:articles).through(:category) }
    it { should have_many(:case_studies).through(:category) }
    it { should have_many(:frequently_asked_questions).through(:category) }
    it { should have_many(:guides).through(:category) }
    it { should have_many(:testimonials).through(:category) }
    it { should have_many(:videos).through(:category) }
    it { should have_many(:body_part_sections) }
  end

  it { should delegate_method(:name).to(:category) }

  it "#image" do
    category = create(:category, name: "Lower Leg")
    body_part = build(:body_part, category: category) 

    expect(body_part.image).to eq("body_parts/lower_leg.jpg")
  end
end
