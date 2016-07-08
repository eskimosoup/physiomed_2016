class AddStandaloneToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :standalone, :boolean, default: false, null: true
    add_column :categories, :image, :string, null: true
    add_column :categories, :content, :string, null: true
    add_column :categories, :tagline, :string, null: true
  end
end
