require 'rails_helper'

RSpec.feature 'job listings admin', type: :feature do
  context "successfully created" do
    it 'creation' do
      visit_job_listing_index
      click_link "New Job Listing"
      fill_job_listing_form(
        title: "Job Title",
        description: "Blah",
        display_from: Date.today,
        display_until: Date.today,
        display: true
      )
      click_button "Save"

      expect(page).to have_admin_index "Job Title"
    end
  end

  context 'with errors' do
    it 'creation' do
      visit_job_listing_index
      click_link "New Job Listing"
      fill_job_listing_form
      click_button "Save"

      expect(page).to have_content "Title can't be blank"
    end
  end

  it 'editing' do
    job_listing = create(:job_listing, title: "Title A")

    visit_job_listing_index
    find(:href, optimadmin.edit_job_listing_path(job_listing)).click
    fill_job_listing_form(title: "Title B")
    click_button "Save"

    expect(page).to have_admin_index "Title B"
  end

  it 'destroying' do
    job_listing = create(:job_listing, title: "A Title")

    visit_job_listing_index
    click_href_destroy(optimadmin.job_listing_path(job_listing))

    expect(page).not_to have_admin_index("A Title")
  end

  def visit_job_listing_index
    admin = create(:administrator)
    login_to_admin_as(admin)
    click_link "Job Listings"
  end

  def fill_job_listing_form(attrs = {})
    attrs.each do |attr, value|
      if attr == :display
        set_checkbox(attr, value)
      else
        fill_in field_name(attr), with: value
      end
    end
  end

  def set_checkbox(attr, value)
    if attr
      check field_name(attr)
    else
      uncheck field_name(attr)
    end
  end

  def field_name(attr)
    "job_listing_#{ attr }"
  end
end
