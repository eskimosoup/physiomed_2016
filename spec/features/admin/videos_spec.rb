require "rails_helper"

feature "Video admin" do
  it "creation" do
    admin = create(:administrator)

    login_to_admin_as(admin)
    click_link "Videos"
    click_link "New Video"
    fill_in "video_title", with: "Blah"
    fill_in "video_youtube_identifier", with: "tbt"
    click_button "Save"
    
    expect(page).to have_admin_index "Blah"
  end

  it "editing" do
    admin = create(:administrator)
    video = create(:video, title: "Video 1")

    login_to_admin_as(admin)
    click_link "Videos"
    find(:href, optimadmin.edit_video_path(video)).click
    fill_in "video_title", with: "Blah"
    fill_in "video_youtube_identifier", with: "tbt"
    click_button "Save"
    
    expect(page).to have_admin_index "Blah"
  end

  it "destroying" do
    admin = create(:administrator)
    video = create(:video, title: "Video 1")

    click_href_destroy(optimadmin.video_path(video))
    expect(page).not_to have_admin_index "Video 1"
  end
end
