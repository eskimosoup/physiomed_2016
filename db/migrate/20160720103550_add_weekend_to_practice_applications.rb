class AddWeekendToPracticeApplications < ActiveRecord::Migration
  def change
    add_column :practice_applications_practices, :saturday, :string
    add_column :practice_applications_practices, :sunday, :string
    change_column :practice_applications_practices, :tm2_or_pps, :string
  end
end
