require 'rails_helper'

RSpec.describe 'videos/_video_with_guide.html.erb' do
  it 'renders the guides image if it exists' do
    video = create(:video, title: "Blah", subtitle: "blah")
    guide = create(:guide, :image, video: video, title: "Some title")

    render partial: "videos/video_with_guide.html.erb",
      locals: { video: video, guide: guide }

    expect(rendered).to have_css "img"
  end

  it 'does not render the guides title' do
    video = create(:video, title: "Blah", subtitle: "blah")
    guide = create(:guide, :image, video: video, title: "Guide title", content: "Guide content")

    render partial: "videos/video_with_guide.html.erb",
      locals: { video: video, guide: guide }

    expect(rendered).not_to have_content(guide.title)
    expect(rendered).not_to have_content(guide.content)
  end
end
