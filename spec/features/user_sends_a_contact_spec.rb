require "rails_helper"

RSpec.feature "User fills in contact form" do
  scenario "successfully" do
    visit new_contact_path
    fill_form({ name: "Bob", email: "bob@example.com", 
                telephone: "01234 567890", message: "Getting in touch"})
    click_button "Send"

    expect(page).to have_content I18n.t('contacts.create.flash')
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  def fill_form(attributes)
    attributes.each do |attr, value|
      fill_in "contact_#{ attr }", with: value
    end
  end
end
