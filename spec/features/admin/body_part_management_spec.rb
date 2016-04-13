require "rails_helper"

feature "Body part management" do
  it "creating a body part", js: true do
    admin = create(:administrator)

    login_to_admin_as(admin)
    click_on "Body Parts"
    click_on "New Body Part"
    fill_body_part_form(name: "Shoulder", introduction: "My head intro")
    click_on "Save"

    expect(page).to have_admin_index "Shoulder"
  end

  it "editing a body part", js: true do
    admin = create(:administrator)
    body_part = create(:body_part, name: "Knee", introduction: "My knee intro")

    login_to_admin_as(admin)
    click_on "Body Parts"
    visit optimadmin.edit_body_part_path(body_part)
    fill_body_part_form(name: "Shoulder", introduction: "My head intro")
    click_on "Save"

    expect(page).to have_admin_index "Shoulder"
  end

  it "destroying a body part" do
    admin = create(:administrator)
    body_part = create(:body_part, name: "Knee", introduction: "My knee intro")

    login_to_admin_as(admin)
    click_on "Body Parts"
    click_href_destroy(optimadmin.body_part_path(body_part))

    expect(page).not_to have_admin_index "Knee"
  end

  def fill_body_part_form(attrs = {})
    attrs.each do |attribute, value|
      if tiny_mce_fields.include?(attribute)
        tiny_mce_fill_in "body_part_#{ attribute }", with: value
      elsif select_fields.include?(attribute)
        select value, from: "body_part_#{ attribute }"
      else
        fill_in "body_part_#{ attribute }", with: value
      end
    end
  end

  def tiny_mce_fields
    %i( introduction )
  end

  def select_fields
    %i( name )
  end
end
