require 'rails_helper'

RSpec.describe "articles/_article", type: :view do
  it "has an image" do
    article = build(:article_with_image)

    render(partial: "articles/article", locals: { article: article })

    expect(rendered).to have_css("img")
  end

  it "has no image" do
    article = build(:article, image: nil)

    render(partial: "articles/article", locals: { article: article })

    expect(rendered).not_to have_css("img")
  end

  it "has an author" do
    team_member = build(:team_member, forename: "Joe")
    article = build(:article, image: nil, author: team_member)

    render(partial: "articles/article", locals: { article: article })

    expect(rendered).to have_css('[data-role="team-member"]')
  end
end
