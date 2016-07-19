require 'rails_helper'

RSpec.describe "layouts/_footer", type: :view do
  context 'with facebook site setting' do
    it 'has a facebook link' do
      stub_global_site_settings_with_facebook
      stub_nested_menu_items

      render_partial

      expect(rendered).to have_facebook_link
    end
  end

  context 'without facebook site setting' do
    it 'has no facebook link' do
      stub_global_site_settings
      stub_nested_menu_items

      render_partial

      expect(rendered).not_to have_facebook_link
    end
  end

  def render_partial
    assign(:physio_search, PhysioSearch.new)
    render partial: "layouts/footer",
      locals: {
        footer_menu: double(menu_items: nil),
      }
  end
  def have_facebook_link
    have_selector(:css, "a[href='#{ facebook_url }']")
  end

  def facebook_url
    "http://www.facebook.com"
  end

  def stub_global_site_settings_with_facebook
    def view.global_site_settings
      {
        "Facebook" => "http://www.facebook.com"
      }
    end
  end

  def stub_global_site_settings
    def view.global_site_settings
      {}
    end
  end

  def stub_nested_menu_items
    allow(view).to receive(:nested_menu_items).and_return(nil)
  end
end
