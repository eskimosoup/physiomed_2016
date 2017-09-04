class AddOptionallyGatedToGuides < ActiveRecord::Migration
  def change
    add_column :guides, :optionally_gated, :boolean
  end
end
