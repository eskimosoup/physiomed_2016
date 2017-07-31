class AddGatedToGuide < ActiveRecord::Migration
  def change
    add_column :guides, :gated, :boolean, default: false
  end
end
