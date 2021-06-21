class AddDetailsUrlToPractice < ActiveRecord::Migration
  def change
    add_column :practices, :details_url, :string
  end
end
