class AddButtonTextToBanners < ActiveRecord::Migration
  def change
    add_column :banners, :button_text, :string, default: 'Read more'
  end
end
