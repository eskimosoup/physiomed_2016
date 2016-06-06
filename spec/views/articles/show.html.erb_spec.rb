require 'rails_helper'

RSpec.describe "articles/show", type: :view do
  it "has an image" do
    article = build(:article_with_image)
    assign(:article, article)

    render

    expect(rendered).to have_css("img")
  end

  it "has no image" do
    article = build(:article, image: nil)
    assign(:article, article)

    render

    expect(rendered).not_to have_css("img")
  end

  it "has an author" do
    team_member = build(:team_member, forename: "Joe")
    article = build(:article, image: nil, author: team_member)

    assign(:article, article)

    render

    expect(rendered).to have_css(".author")
  end
end
