class AddLinkToServiceStandard < ActiveRecord::Migration
  def change
    add_column :service_standards, :link, :string
  end
end
