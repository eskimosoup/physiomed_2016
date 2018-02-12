class Articles::Guide < ActiveRecord::Base
  belongs_to :article, class_name: '::Article'
  belongs_to :guide, class_name: '::Guide'
end
