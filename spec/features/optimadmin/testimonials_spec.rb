require "rails_helper"

RSpec.feature "Testimonial admin" do
  it "creation" do
    admin = create(:administrator)

    login_to_admin_as(admin)
    click_link "Testimonials"
    click_link "New Testimonial"

    fill_testimonial_form(title: "Test", author: "John", content: "Content", role: "Blah")
    click_button "Save"

    expect(page).to have_admin_index "Test"
  end

  it "editing" do
    admin = create(:administrator)
    testimonial = create(:testimonial, title: "title")

    login_to_admin_as(admin)
    click_link "Testimonials"
    find(:href, optimadmin.edit_testimonial_path(testimonial)).click
    fill_testimonial_form(title: "new title")
    click_button "Save"

    expect(page).to have_admin_index "new title"
  end

  it "destroying" do
    admin = create(:administrator)
    testimonial = create(:testimonial, title: "title")

    login_to_admin_as(admin)
    click_link "Testimonials"
    click_href_destroy(optimadmin.testimonial_path(testimonial))

    expect(page).not_to have_admin_index "title"
  end

  def fill_testimonial_form(attrs = {})
    attrs.each do |attr, val|
      fill_in "testimonial_#{ attr }", with: val
    end
  end
end
