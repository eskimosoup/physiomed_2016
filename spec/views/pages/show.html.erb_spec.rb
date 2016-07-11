require 'rails_helper'

RSpec.describe "pages/show", type: :view do
  context "has a what we do" do
    it 'has a side menu' do
      dynamic_page = create(:page)
      what_we_do = create(:what_we_do, title: 'Some title')
      stub_inline_editable
      stub_global_site_settings
      assign(:page, dynamic_page)
      assign(:what_we_dos, [what_we_do])

      render

      expect(rendered).to have_content what_we_do.title
    end
  end

  context "has no what we do" do
    it 'has no side menu' do
      dynamic_page = build(:page)
      stub_inline_editable
      stub_global_site_settings
      assign(:page, dynamic_page)

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
end
