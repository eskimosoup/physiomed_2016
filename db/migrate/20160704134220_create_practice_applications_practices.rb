class CreatePracticeApplicationsPractices < ActiveRecord::Migration
  def change
    create_table :practice_applications_practices do |t|
      t.string :name, null: false
      t.text :address, null: false
      t.string :county
      t.string :postcode, null: false
      t.string :telephone, null: false
      t.string :fax
      t.string :email, null: false
      t.boolean :public_liability_insurance, null: false, default: true
      t.boolean :employee_liability_insurance, null: false, default: true
      t.string :full_time
      t.string :part_time
      t.string :male
      t.string :female
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday
      t.string :number_of_locations
      t.string :capacity
      t.boolean :receptionist, null: false
      t.boolean :parking_facilities, null: false
      t.string :established
      t.boolean :word_access
      t.text :cancellation_policy
      t.string :cheques_payable_to
      t.text :description
      t.string :treatment_rooms
      t.string :treatment_min_time
      t.string :initial_assessment_cost
      t.string :subsequent_treatment_cost
      t.string :image_1
      t.string :image_2
      t.string :image_3

      t.timestamps null: false
    end
  end
end
