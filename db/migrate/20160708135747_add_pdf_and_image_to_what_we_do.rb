class AddPdfAndImageToWhatWeDo < ActiveRecord::Migration
  def change
    add_column :what_we_dos, :pdf_download, :string, null: true
    add_column :what_we_dos, :image, :string, null: true
  end
end
