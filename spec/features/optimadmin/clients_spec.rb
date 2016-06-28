require 'rails_helper'

RSpec.feature 'Clients management' do
  it 'creating' do
    client_name = "Jeff Parsons"
    file = File.join(Rails.root, "spec/support/images/landscape_image.jpg")

    go_to_index
    click_link "New Client"
    fill_in "client_name", with: client_name
    attach_file "client_logo", file
    click_button "Save"

    expect(page).to have_admin_index client_name
  end

  it 'editing' do
    old_name = "Joe Blogs"
    client = create(:client, name: old_name)

    go_to_index
    click_edit_link(client)
    fill_in "client_name", with: "Some new name"
    click_button "Save"

    expect(page).to have_admin_index "Some new name"
    expect(page).not_to have_admin_index old_name
  end

  def go_to_index
    admin = create(:administrator)
    login_to_admin_as(admin)
    click_link "Clients"
  end

  def click_edit_link(client)
    find(:href, optimadmin.edit_client_path(client)).click
  end
end
