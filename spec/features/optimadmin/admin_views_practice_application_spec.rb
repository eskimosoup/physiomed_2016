require 'rails_helper'

RSpec.feature "Admin practice applications" do
  scenario 'viewing practice application' do
    admin = create(:administrator)
    practice_application = create(:practice_applications_practice, name: "Some name")
    contact = create(
      :practice_applications_contact,
      name: "Xavier", position: "F", practice: practice_application)
    practitioner = create(
      :practice_applications_practitioner,
      practice: practice_application, name: "Bob")

    login_to_admin_as(admin)
    click_link "Practice Applications"
    find(:href, optimadmin.practice_application_path(practice_application)).click

    expect(page).to have_content practice_application.name
    expect(page).to have_content contact.name
    expect(page).to have_content practitioner.name
  end
end
