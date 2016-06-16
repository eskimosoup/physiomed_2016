class AssociateBodyPartsAndCategories < ActiveRecord::Migration
  def change
    remove_column :body_parts, :name, :string
    add_reference :body_parts, :category, index: { unique: true }, foreign_key: true
  end
end
