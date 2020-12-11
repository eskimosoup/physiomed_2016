class AddButtonToLandingPagesSection < ActiveRecord::Migration
  def change
    add_column :landing_pages_sections, :button_link, :string
    add_column :landing_pages_sections, :button_text, :string
  end
end
