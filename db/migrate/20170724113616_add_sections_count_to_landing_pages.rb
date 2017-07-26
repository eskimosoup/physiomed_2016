class AddSectionsCountToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :sections_count, :integer, null: false, default: 0
  end
end
