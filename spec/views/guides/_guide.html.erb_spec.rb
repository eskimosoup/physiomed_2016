require 'rails_helper'

RSpec.describe 'guides/_guide.html.erb' do
  context 'has an image' do
    it 'renders an image' do
      guide = create(:guide_with_image)

      render_guide(guide)

      expect(rendered).to have_css "img"
    end
  end

  context 'has no image' do
    it 'does not render an image' do
      guide = create(:guide, image: nil)

      render_guide(guide)

      expect(rendered).not_to have_css "img"
    end
  end

  def render_guide(guide)
    render "guides/guide", guide: guide
  end
end
