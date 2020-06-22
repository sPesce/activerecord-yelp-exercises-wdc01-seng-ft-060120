require 'pry'
class Restaurant < ActiveRecord::Base
  validates :name, presence: true
  has_many :dishes
  

end