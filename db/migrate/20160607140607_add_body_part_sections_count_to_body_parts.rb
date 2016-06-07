class AddBodyPartSectionsCountToBodyParts < ActiveRecord::Migration
  def change
    add_column :body_parts, :body_part_sections_count, :integer, null: false, default: 0
  end
end
