class AddStyleToLandingPagesSection < ActiveRecord::Migration
  def change
    add_column :landing_pages_sections, :style, :string, default: 'basic', null: false
  end
end
