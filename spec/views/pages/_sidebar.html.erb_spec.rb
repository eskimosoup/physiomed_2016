require 'rails_helper'

RSpec.describe "pages/_sidebar", type: :view do
  context 'has testimonials' do
    it 'renders the testimonials' do
      testimonial = build(:testimonial, display: true)
      page = create(:page, image: nil, testimonials: [testimonial])

      render_partial(page)

      expect(rendered).to have_testimonial
    end
  end

  context 'no testimonials' do
    it 'does not render testimonials' do
      page = create(:page, image: nil, testimonials: [])

      render_partial(page)

      expect(rendered).not_to have_testimonial
    end
  end

  def render_partial(page)
    render partial: 'pages/sidebar.html.erb', locals: { page: page }
  end
  
  def have_testimonial
    have_css '[data-role="testimonial"]'
  end
end
