require 'rails_helper'

RSpec.feature "user applies for job listing", type: :feature do
  scenario "successfully" do
    job_listing = create(:job_listing, title: "Job Listing")

    visit job_listings_path
    click_link job_listing.title

    fill_application_form(
      name: "joe bloggs",
      telephone: "01482 456 789",
      email: "joe.bloggs@example.com",
    )
    attach_file field_name(:cv), File.join("#{ Rails.root }/spec/support/images/landscape_image.jpg")
    click_button "Create Job application"

    expect(page).to have_content I18n.t('job_applications.create.flash')
    expect(last_email).to have_subject(
      I18n.t('mailers.job_application.application_made.subject')
    )
  end

  scenario "unsuccessfully" do
    job_listing = create(:job_listing, title: "Job Listing")

    visit job_listings_path
    click_link job_listing.title
    click_button "Create Job application"

    within '.job_application_name' do
      expect(page).to have_content "can't be blank"
    end
  end

  def fill_application_form(attrs = {})
    attrs.each do |attr, value|
      fill_in field_name(attr), with: value
    end
  end

  def field_name(attr)
    "job_application_#{ attr }"
  end
end
