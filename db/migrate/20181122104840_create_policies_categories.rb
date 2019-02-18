class CreatePoliciesCategories < ActiveRecord::Migration
  def change
    create_table :policies_categories do |t|
      t.integer :position, default: 0, null: false
      t.string :title, null: false
      t.integer :documents_count, default: 0
      t.boolean :display, default: true
      t.string :suggested_url
      t.string :slug, index: true, unique: true

      t.timestamps null: false
    end
  end
end
