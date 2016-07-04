class CreatePracticeApplicationsContacts < ActiveRecord::Migration
  def change
    create_table :practice_applications_contacts do |t|
      t.references :practice, index: true
      t.string :name, null: false
      t.string :position, null: false

      t.timestamps null: false
    end
    add_foreign_key :practice_applications_contacts, :practice_applications_practices, { column: :practice_id, on_delete: :cascade }
  end
end
