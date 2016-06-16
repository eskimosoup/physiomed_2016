require "rails_helper"

describe SlugConstraint do
  describe "#matches?" do
    context "when request has an id that matches a slug" do
      it "returns true if not using friendly id history" do
        category = create(:category)
        body_part = create(:body_part, category: category)
        request = stub_request_with_id(body_part.slug)

        expect(SlugConstraint.new(BodyPart).matches?(request)).to be true
      end

      it "returns true when using history" do
        article = create(:article)
        request = stub_request_with_id(article.slug)

        expect(SlugConstraint.new(Article).matches?(request)).to be true
      end
    end

    context "when request has an id that doesn't match the right model" do
      it "returns false" do
        article = create(:article)
        request = stub_request_with_id(article.slug)

        expect(SlugConstraint.new(BodyPart).matches?(request)).to be false
      end
    end

    context "when request has an id that doesn't march a slug" do
      it "returns false" do
        request = stub_request_with_id("test")

        expect(SlugConstraint.new(BodyPart).matches?(request)).to be false
      end
    end
  end

  def stub_request_with_id(id)
    double("request", path_parameters: { id: id })
  end
end
