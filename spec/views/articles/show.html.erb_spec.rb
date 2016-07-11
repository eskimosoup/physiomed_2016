require 'rails_helper'

RSpec.describe "articles/show", type: :view do
  it "has an image" do
    stub_global_site_settings
    article = build(:article_with_image)
    assign(:article, article)

    render

    expect(rendered).to have_css("img")
  end

  it "has no image" do
    stub_global_site_settings
    article = build(:article, image: nil)
    assign(:article, article)

    render

    expect(rendered).not_to have_css("img")
  end

  it "has an author" do
    stub_global_site_settings
    team_member = build(:team_member, forename: "Joe")
    article = build(:article, image: nil, author: team_member)

    assign(:article, article)

    render

    expect(rendered).to have_css('[data-role="team-member"]')
  end

  def stub_global_site_settings
    def view.global_site_settings
      {}
    end
  end
end
