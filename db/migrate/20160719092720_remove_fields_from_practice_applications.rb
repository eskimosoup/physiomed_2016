class RemoveFieldsFromPracticeApplications < ActiveRecord::Migration
  def change
    remove_column :practice_applications_practices, :full_time, :string
    remove_column :practice_applications_practices, :part_time, :string
    remove_column :practice_applications_practices, :male, :string
    remove_column :practice_applications_practices, :female, :string
    remove_column :practice_applications_practices, :number_of_locations, :string
    remove_column :practice_applications_practices, :word_access, :boolean
    remove_column :practice_applications_practices, :cheques_payable_to, :string
    remove_column :practice_applications_practices, :image_1, :string
    remove_column :practice_applications_practices, :image_2, :string
    remove_column :practice_applications_practices, :image_3, :string
    remove_column :practice_applications_practices, :treatment_min_time, :string
  end
end
