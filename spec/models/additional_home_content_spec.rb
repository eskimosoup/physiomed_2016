require "rails_helper"

describe AdditionalHomeContent, type: :model do
  describe "validations" do
    it { should validate_presence_of(:content_type) }
    it { should validate_inclusion_of(:content_type).in_array(AdditionalHomeContent::CONTENT_TYPES) }
    it { should validate_presence_of(:title) }

    context "video content" do
      it do
        home_content = build(:video_additional_home_content)

        expect(home_content).to validate_presence_of(:video)
      end
    end

    context "text content" do
      it do
        home_content = build(:text_additional_home_content)

        expect(home_content).to validate_presence_of(:content)
      end
    end
  end

  describe "associations" do
    it { should belong_to(:video) }
  end

  it "#video?" do
    video = AdditionalHomeContent.new(content_type: "video_content")
    text = AdditionalHomeContent.new(content_type: "text_content")
    calc = AdditionalHomeContent.new(content_type: "savings_calculator")

    expect(video.video?).to eq(true)
    expect(text.video?).to eq(false)
    expect(calc.video?).to eq(false)
  end

  it "#text?" do
    video = AdditionalHomeContent.new(content_type: "video_content")
    text = AdditionalHomeContent.new(content_type: "text_content")
    calc = AdditionalHomeContent.new(content_type: "savings_calculator")

    expect(video.text?).to eq(false)
    expect(text.text?).to eq(true)
    expect(calc.text?).to eq(false)
  end

  it "#savings_calculator?" do
    video = AdditionalHomeContent.new(content_type: "video_content")
    text = AdditionalHomeContent.new(content_type: "text_content")
    calc = AdditionalHomeContent.new(content_type: "savings_calculator")

    expect(video.savings_calculator?).to eq(false)
    expect(text.savings_calculator?).to eq(false)
    expect(calc.savings_calculator?).to eq(true)
  end

  it "#to_partial_path" do
    video = AdditionalHomeContent.new(content_type: "video_content")
    text = AdditionalHomeContent.new(content_type: "text_content")
    calc = AdditionalHomeContent.new(content_type: "savings_calculator")

    expect(video.to_partial_path).to eq("additional_home_contents/video_content")
    expect(text.to_partial_path).to eq("additional_home_contents/text_content")
    expect(calc.to_partial_path).to eq("additional_home_contents/savings_calculator")
  end
end
