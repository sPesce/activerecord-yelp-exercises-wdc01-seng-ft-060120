require 'pry'
class Restaurant < ActiveRecord::Base
  validates :name, presence: true
  has_many :dishes

  def self.mcdonalds 
    mcd = Restaurant.find_by(name: "McDonalds") 
    return mcd 
  end 

  def self.tenth
    tenth = Restaurant.find(10)
    return tenth
  end 

  def self.with_long_names
    Restaurant.where("length(name) > 12")
  end 

  def self.restaurant_count 
    dish_hash = Dish.group(:restaurant_id).count
  end

  def self.max_dishes
    #dishes = Dish.group(:restaurant_id).count 
    #Dish.select("count(restaurant_id) as frequency").group("restaurant_id")
    dish_hash = self.restaurant_count
    id = dish_hash.key(dish_hash.values.max)
    Restaurant.find(id)
  end 

  def self.focused
    # dish_hash = self.restaurant_count
    # dish_array = []
    # dish_hash.each do |k, v|
    #   if v < 5   
    #     dish_array << k 
    #   end 
    # end 
    # dish_array.map do |restaurant|
    #   Restaurant.find(restaurant)
    # end 
    self.dish_count_range(0, 5)
  end 

  def self.dish_count_range(min, max=nil)
    dish_hash = self.restaurant_count
    dish_array = []
    dish_hash.each do |k, v|
      if max == nil 
        if v > min   
          dish_array << Restaurant.find(k)
        end 
      else 
        if v > min && v < max 
          dish_array << Restaurant.find(k) 
        end 
      end 
    end
    dish_array
  end 

  def self.large_menu 
    self.dish_count_range(20)
  
  end 

  # def self.vegetarian
  #   Dish.
  # end 

end