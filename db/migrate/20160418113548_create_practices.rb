class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.string :name, null: false
      t.string :address
      t.string :town
      t.string :county
      t.string :post_code, null: false
      t.float :latitude
      t.float :longitude
      t.boolean :display, null: false, default: true

      t.timestamps null: false
    end
  end
end
