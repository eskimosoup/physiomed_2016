require 'rails_helper'

RSpec.feature 'job applications admin' do
  scenario 'viewing' do
    job_listing = create(:job_listing, title: "Job title")
    job_application = create(
      :job_application, 
      job_listing: job_listing,
      name: "Joe bloggs",
      email: "joe@bloggs.com",
      telephone: "01234 567890"
    )

    visit_job_application_index(job_listing)

    expect(page).to have_admin_index job_application.name
    expect(page).to have_admin_index job_application.email
    expect(page).to have_admin_index job_application.telephone
  end

  def visit_job_application_index(job_listing)
    admin = create(:administrator)
    login_to_admin_as(admin)
    click_link "Job Listings"
    click_link "1 Job application"
  end
end
