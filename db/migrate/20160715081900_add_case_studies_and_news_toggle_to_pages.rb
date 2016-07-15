class AddCaseStudiesAndNewsToggleToPages < ActiveRecord::Migration
  def change
    add_column :pages, :display_case_studies, :boolean, default: false
    add_column :pages, :display_news, :boolean, default: false
  end
end
