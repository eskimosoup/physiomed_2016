require 'rails_helper'

RSpec.describe BannerPresenter, type: :presenter, banner: true do
  it "#image" do
    banner = build(:banner)
    banner_presenter = BannerPresenter.new(object: banner, view_template: view)

    image = image_tag banner.image.show

    expect(banner_presenter.show_image).to eq(image)
  end

  it "#title" do
    banner = build(:banner)
    banner_presenter = BannerPresenter.new(object: banner, view_template: view)
    
    title = content_tag :h1, banner.title

    expect(banner_presenter.title).to eq(title)
  end

  context "has summary" do
    it "#summary" do
      banner = build(:banner, summary: "my summary")
      banner_presenter = BannerPresenter.new(object: banner, view_template: view)

      summary = simple_format banner.summary

      expect(banner_presenter.summary).to eq(summary)
    end
  end

  context "has no summary" do
    it "#summary" do
      banner = build(:banner, summary: nil)
      banner_presenter = BannerPresenter.new(object: banner, view_template: view)

      expect(banner_presenter.summary).to eq(nil)
    end
  end

  context "has a link" do
    it "#link" do
      banner = build(:banner, link: "http://www.google.co.uk")
      banner_presenter = BannerPresenter.new(object: banner, view_template: view)

      link = link_to "Read More", banner.link

      expect(banner_presenter.link).to eq(link)
    end
  end

  context "has no link" do
    it "#link" do
      banner = build(:banner, link: nil)
      banner_presenter = BannerPresenter.new(object: banner, view_template: view)

      expect(banner_presenter.link).to eq(nil)
    end
  end
end
