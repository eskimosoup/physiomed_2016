class AddButtonToServicesSectionItems < ActiveRecord::Migration
  def change
    add_column :services_section_items, :button_text, :string
    add_column :services_section_items, :button_link, :string
    add_column :services_sections, :button_link, :string
    add_column :services_sections, :button_text, :string
  end
end
