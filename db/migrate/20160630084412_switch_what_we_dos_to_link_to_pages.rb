class SwitchWhatWeDosToLinkToPages < ActiveRecord::Migration
  def change
    remove_column :what_we_do_links, :url, :string
    add_reference :what_we_do_links, :page, index: { unique: true }, foreign_key: { on_delete: :nullify }
  end
end
