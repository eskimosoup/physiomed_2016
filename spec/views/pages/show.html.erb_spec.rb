require 'rails_helper'

RSpec.describe "pages/show", type: :view do
  context "has a what we do" do
    it 'has a side menu' do
      dynamic_page = create(:page)
      what_we_do = create(:what_we_do, title: 'Some title')
      create(:what_we_do_link, page: dynamic_page, what_we_do: what_we_do)
      facade = build_facade(dynamic_page)
      stub_inline_editable
      stub_global_site_settings
      assign(:page_facade, facade)

      render

      expect(rendered).to have_content what_we_do.title
    end
  end

  context "has no what we do" do
    it 'has no side menu' do
      dynamic_page = build(:page)
      facade = build_facade(dynamic_page)
      stub_inline_editable
      stub_global_site_settings
      assign(:page_facade, facade)

      render

      expect(rendered).to have_css ".full-width"
    end
  end

  def stub_inline_editable
    allow(view).to receive(:inline_editable).and_return(nil)
  end

  def stub_global_site_settings
    def view.global_site_settings
      {}
    end
  end

  def build_facade(page)
    PageFacade.new(page)
  end
end
