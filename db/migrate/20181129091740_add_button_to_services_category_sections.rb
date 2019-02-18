class AddButtonToServicesCategorySections < ActiveRecord::Migration
  def change
    add_column :services_category_sections, :button_link, :string
    add_column :services_category_sections, :button_text, :string
    add_column :services_category_sections, :subtitle, :string
  end
end
