class AssociatePeopleHelpedSectionsWithCategories < ActiveRecord::Migration
  def change
    remove_column :people_helped_sections, :section, :string
    add_reference :people_helped_sections, :category, index: { unique: true }, foreign_key: { on_delete: :cascade }
  end
end
