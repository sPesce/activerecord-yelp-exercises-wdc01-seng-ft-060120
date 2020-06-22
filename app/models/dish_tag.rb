class DishTag < ActiveRecord::Base

  belongs_to :dishes
  belongs_to :tags
  
end