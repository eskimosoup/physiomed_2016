class AddFieldsToPracticeApplicationsPractices < ActiveRecord::Migration
  def change
    add_column :practice_applications_practices, :initial_assessment_duration, :string
    add_column :practice_applications_practices, :subsequent_treatment_duration, :string
    add_column :practice_applications_practices, :manual_therapy, :string
    add_column :practice_applications_practices, :tm2_or_pps, :boolean
    add_column :practice_applications_practices, :online_booking, :boolean
  end
end
