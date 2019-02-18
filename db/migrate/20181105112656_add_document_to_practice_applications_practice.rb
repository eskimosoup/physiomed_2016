class AddDocumentToPracticeApplicationsPractice < ActiveRecord::Migration
  def change
    add_column :practice_applications_practices, :document, :string
  end
end
