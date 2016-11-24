class AddClientZoneToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :display_on_client_zone, :boolean, default: false, null: true
  end
end
