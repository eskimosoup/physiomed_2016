class AddVideoToGuides < ActiveRecord::Migration
  def change
    add_reference :guides, :video, index: { unique: true },
      foreign_key: { on_delete: :cascade }
  end
end
