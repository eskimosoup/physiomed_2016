class Categories::Guide < ActiveRecord::Base
  belongs_to :category
  belongs_to :guide
end
