class AddStyleToServiceCategorySections < ActiveRecord::Migration
  def change
    add_column :services_category_sections, :style, :string, default: 'basic'
  end
end
