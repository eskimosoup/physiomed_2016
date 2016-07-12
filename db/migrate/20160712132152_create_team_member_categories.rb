class CreateTeamMemberCategories < ActiveRecord::Migration
  def change
    create_table :team_member_categories do |t|
      t.string :title, null: false
      t.integer :position, null: false, default: 0
      t.string :category_type, index: { unique: true }, null: false

      t.timestamps null: false
    end
  end
end
