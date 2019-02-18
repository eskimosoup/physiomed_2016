class AddSubtitleToServicesSectionItems < ActiveRecord::Migration
  def change
    add_column :services_section_items, :subtitle, :string
  end
end
