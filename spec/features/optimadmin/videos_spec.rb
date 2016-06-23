require "rails_helper"

RSpec.feature "Video admin" do
  it "creation" do
    admin = create(:administrator)

    login_to_admin_as(admin)
    click_link "Videos"
    click_link "New Video"
    fill_video_form(
      title: "Blah",
      subtitle: "some subtitle",
      content: "blah",
      youtube_identifier: "tbt"
    )
    click_button "Save"
    
    expect(page).to have_admin_index "Blah"
  end

  it "editing" do
    admin = create(:administrator)
    video = create(:video, title: "Video 1")

    login_to_admin_as(admin)
    click_link "Videos"
    find(:href, optimadmin.edit_video_path(video)).click
    fill_video_form(
      title: "Blah",
    )
    click_button "Save"
    
    expect(page).to have_admin_index "Blah"
  end

  it "destroying" do
    admin = create(:administrator)
    video = create(:video, title: "Video 1")

    click_href_destroy(optimadmin.video_path(video))
    expect(page).not_to have_admin_index "Video 1"
  end

  def fill_video_form(attrs = {})
    attrs.each do |attr, value|
      fill_in "video_#{ attr }", with: value
    end
  end
end
