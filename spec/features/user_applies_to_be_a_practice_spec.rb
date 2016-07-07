require 'rails_helper'

RSpec.feature 'User applies to be a practice' do
  scenario 'successfully', js: true do
    visit new_practice_application_path
    fill_form({
      name: "Local Physio Solutions",
      address: "Some address",
      postcode: "HU1 1NQ",
      telephone: "01234 567890",
      email: "support@example.com",
      terms_and_conditions: true,
      first_contact_name: "Joe Bloggs",
      first_contact_position: "Some role",
      public_liability_insurance: "Yes",
      employee_liability_insurance: "Yes",
    })
    click_link "Add Practitioner"
    fill_in_practitioner_form({
      name: "James"
    })
    click_button "Create Practice application"

    expect(page).to have_content I18n.t('practice_applications.create.flash')
    expect(last_email).to have_subject(
      I18n.t('mailers.practice_application.application_made.subject')
    )
  end

  scenario 'contact details must both be filled out if provided' do
    visit new_practice_application_path
    fill_form({
      first_contact_name: "Joe Bloggs",
    })
    click_button "Create Practice application"

    within ".practice_application_first_contact_position" do
      expect(page).to have_content "can't be blank"
    end
  end

  def fill_form(attrs = {})
    attrs.each do |attr, value|
      if attr == :terms_and_conditions
        check_checkbox(attr, value)
      elsif [:public_liability_insurance, :employee_liability_insurance].include?(attr)
        select value, from: field_name(attr)
      else
        fill_in field_name(attr), with: value
      end
    end
  end

  def fill_in_practitioner_form(attrs = {})
    attrs.each do |attr, value|
      within "#practitioners" do
        fill_in attr.to_s.titleize, with: value
      end
    end
  end

  def check_checkbox(attr, value)
    if value
      check(field_name(attr))
    else
      uncheck(field_name(attr))
    end
  end

  def field_name(attr)
    "practice_application_#{ attr }"
  end
end
