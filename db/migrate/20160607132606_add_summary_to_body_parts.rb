class AddSummaryToBodyParts < ActiveRecord::Migration
  def change
    add_column :body_parts, :summary, :text, null: true
  end
end
