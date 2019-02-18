class CreatePoliciesDocuments < ActiveRecord::Migration
  def change
    create_table :policies_documents do |t|
      t.belongs_to :policies_category, index: true, foreign_key: true
      t.integer :position, default: 0, null: false
      t.string :title, null: false
      t.text :summary
      t.string :file
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
