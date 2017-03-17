class AddExpiryDatesToPracticeApplicationsPractice < ActiveRecord::Migration
  def change
    add_column :practice_applications_practices, :public_liability_expiry_date, :date
    add_column :practice_applications_practices, :employee_liability_expiry_date, :date
  end
end
