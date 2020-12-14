class AddHeaderTextToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :header_text, :text
  end
end
