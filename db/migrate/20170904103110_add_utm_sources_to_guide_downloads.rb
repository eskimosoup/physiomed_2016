class AddUtmSourcesToGuideDownloads < ActiveRecord::Migration
  def change
    add_column :guide_downloads, :utm_source, :string
    add_column :guide_downloads, :utm_campaign, :string
    add_column :guide_downloads, :utm_medium, :string
    add_column :guide_downloads, :utm_term, :string
  end
end
