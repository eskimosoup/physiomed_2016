class RemoveNullConstraintFromLandingPagesSectionsTitle < ActiveRecord::Migration
  def change
    change_column_null(:landing_pages_sections, :title, true)
  end
end
