class AddLinksCountToWhatWeDos < ActiveRecord::Migration
  def change
    add_column :what_we_dos, :links_count, :integer, null: false, default: 0
  end
end
