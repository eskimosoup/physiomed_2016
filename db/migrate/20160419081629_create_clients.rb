class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :logo, null: false
      t.string :slug, index: { unique: true }
      t.integer :position, null: false, default: 0
      t.boolean :display, null: false, default: true

      t.timestamps null: false
    end
  end
end
