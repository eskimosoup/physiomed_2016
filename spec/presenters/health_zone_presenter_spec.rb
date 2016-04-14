require 'rails_helper'

RSpec.describe HealthZonePresenter, type: :presenter, health_zone: true do
  describe "delegations" do
    it do
      health_zone = build(:health_zone, title: "Blah")
      health_zone_presenter = HealthZonePresenter.new(object: health_zone, view_template: view)

      expect(health_zone_presenter).to delegate_method(:id).to(:health_zone)
    end

    it do
      health_zone = build(:health_zone, title: "Blah")
      health_zone_presenter = HealthZonePresenter.new(object: health_zone, view_template: view)

      expect(health_zone_presenter).to delegate_method(:title).to(:health_zone)
    end

    it do
      health_zone = build(:health_zone, title: "Blah")
      health_zone_presenter = HealthZonePresenter.new(object: health_zone, view_template: view)

      expect(health_zone_presenter).to delegate_method(:link).to(:health_zone)
    end

    it do
      health_zone = build(:health_zone, title: "Blah")
      health_zone_presenter = HealthZonePresenter.new(object: health_zone, view_template: view)

      expect(health_zone_presenter).to delegate_method(:hover_text).to(:health_zone).with_prefix
    end

    it do
      health_zone = build(:health_zone, title: "Blah")
      health_zone_presenter = HealthZonePresenter.new(object: health_zone, view_template: view)

      expect(health_zone_presenter).to delegate_method(:content).to(:health_zone).with_prefix
    end
  end

  it "#title" do
    health_zone = build(:health_zone, title: "Blah")
    health_zone_presenter = HealthZonePresenter.new(object: health_zone, view_template: view)

    expect(health_zone_presenter.title).to eq(health_zone.title)
  end

  it "#title_link" do
    health_zone = build(:health_zone, title: "Blah", link: "http://www.google.co.uk")
    health_zone_presenter = HealthZonePresenter.new(object: health_zone, view_template: view)

    link = link_to health_zone.title, health_zone.link

    expect(health_zone_presenter.title_link).to eq(link)
  end

  it "#show_home_image" do
    health_zone = build(:health_zone)
    health_zone_presenter = HealthZonePresenter.new(object: health_zone, view_template: view)

    image = image_tag health_zone.home_image.show

    expect(health_zone_presenter.show_home_image).to eq(image)
  end

  it "#hover_text" do
    health_zone = build(:health_zone, hover_text: "My text")
    health_zone_presenter = HealthZonePresenter.new(object: health_zone, view_template: view)

    text = simple_format("My text")

    expect(health_zone_presenter.hover_text).to eq(text)
  end

  context "has image" do
    it "#show_image" do
      health_zone = build(:health_zone_with_image)
      health_zone_presenter = HealthZonePresenter.new(object: health_zone, view_template: view)

      image = image_tag health_zone.image.show

      expect(health_zone_presenter.show_image).to eq(image)
    end
  end

  context "has no image" do
    it "#show_image" do
      health_zone = build(:health_zone, image: nil)
      health_zone_presenter = HealthZonePresenter.new(object: health_zone, view_template: view)

      expect(health_zone_presenter.show_image).to eq(nil)
    end
  end

  context "has content" do
    it "#content" do
      health_zone = build(:health_zone, title: "Health Zone", content: "<p>Health zone content</p>")
      health_zone_presenter = HealthZonePresenter.new(object: health_zone, view_template: view)

      content = content_tag :div, class: "content" do
        raw("<p>Health zone content</p>")
      end

      expect(health_zone_presenter.content).to eq(content)
    end
  end

  context "has no content" do
    it "#content" do
      health_zone = build(:health_zone, title: "Health Zone", content: nil)
      health_zone_presenter = HealthZonePresenter.new(object: health_zone, view_template: view)

      expect(health_zone_presenter.content).to eq(nil)
    end
  end

  it "#read_more_link" do
    health_zone = build(:health_zone, title: "Health Zone", link: "http://www.google.co.uk")
    health_zone_presenter = HealthZonePresenter.new(object: health_zone, view_template: view)

    link = link_to "Read more", "http://www.google.co.uk"

    expect(health_zone_presenter.read_more_link).to eq(link)
  end
end
