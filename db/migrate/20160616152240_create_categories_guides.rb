class CreateCategoriesGuides < ActiveRecord::Migration
  def change
    create_table :categories_guides do |t|
      t.belongs_to :category, index: true, foreign_key: { on_delete: :cascade }
      t.belongs_to :guide, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end
  end
end
