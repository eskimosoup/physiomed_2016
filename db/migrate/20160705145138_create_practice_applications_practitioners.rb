class CreatePracticeApplicationsPractitioners < ActiveRecord::Migration
  def change
    create_table :practice_applications_practitioners do |t|
      t.references :practice, index: true
      t.string :name
      t.string :csp_number
      t.string :hpc_number
      t.boolean :ocppp_member, null: false, default: false
      t.date :qualification_date
      t.string :years_practicing
      t.text :specialisation_areas
      t.boolean :domiciliary_visits, null: false, default: false
      t.string :manual_treatments
      t.boolean :bupa_registered, null: false, default: false
      t.boolean :cpd, null: false, default: false

      t.timestamps null: false
    end
    add_foreign_key :practice_applications_practitioners, :practice_applications_practices, { column: :practice_id, on_delete: :cascade }
  end
end
