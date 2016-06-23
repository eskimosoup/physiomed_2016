require 'rails_helper'

RSpec.feature 'user visits what we do page' do
  scenario 'they see what we dos' do
    what_we_do = create(:what_we_do, title: "We prevent people going off work")
    link = create(:what_we_do_link, what_we_do: what_we_do, title: "Our work")
    visit what_we_do_path

    expect(page).to have_css "h1.what-we-do-title",
      text: "We look after your staff, so your business looks after itself."
    expect(page).to have_css "[data-role=what-we-do-title]",
      text: what_we_do.title
    expect(page).to have_css "[data-role=what-we-do-link]",
      text: link.title
  end
end
