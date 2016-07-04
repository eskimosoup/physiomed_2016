class Subcategories::Video < ActiveRecord::Base
  belongs_to :subcategory, class_name: '::Subcategory'
  belongs_to :video, class_name: '::Video'
end
