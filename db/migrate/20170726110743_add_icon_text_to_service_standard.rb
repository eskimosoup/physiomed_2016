class AddIconTextToServiceStandard < ActiveRecord::Migration
  def change
    add_column :service_standards, :icon_text, :string
  end
end
