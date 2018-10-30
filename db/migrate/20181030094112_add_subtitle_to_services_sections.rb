class AddSubtitleToServicesSections < ActiveRecord::Migration
  def change
    add_column :services_sections, :subtitle, :string
  end
end
