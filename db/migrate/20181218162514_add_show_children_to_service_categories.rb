class AddShowChildrenToServiceCategories < ActiveRecord::Migration
  def change
    add_column :services_categories, :show_children, :boolean, default: true
  end
end
