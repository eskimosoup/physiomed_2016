class AddAdditionalFieldsToPracticeApplicationsPractice < ActiveRecord::Migration
  def change
    add_column :practice_applications_practices, :disabled_access, :boolean
    add_column :practice_applications_practices, :bupa_registered, :boolean
    add_column :practice_applications_practices, :domiciliary_visits, :boolean
  end
end
