# This migration comes from optimadmin (originally 20180426140640)
class AddPasswordChangedAtToOptimadminAdministrators < ActiveRecord::Migration
  def change
    add_column :optimadmin_administrators, :password_changed_at, :datetime
    Optimadmin::Administrator.update_all(password_changed_at: Time.zone.now)
  end
end
