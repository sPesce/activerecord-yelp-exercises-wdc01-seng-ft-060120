tag_name = 
[
  "Spicy","Sweet","Vegetarian",
  "Vegan","Mexican","Itallian",
  "American","Indian","Chinese",
  "Fast-Food"
]
tag_name.each{|tag|Tag.create(name: tag)}

dish_names = 
[
  "Hamburger","Cheeseburger","Eggs","Stuffed Shells","Pizza",
  "French fries","Tacos","Burritos","Rice and beans","Steak and Potatoes",
  "Beef stew","Ministrone soup", "Wonton soup", "Egg roll", "BBQ Ribs", "BBQ Chicken",
  "Chicken Sandwich"
]

i = 0
while(i<20)
  my_restaurant = Restaurant.create(name: "Restaurant ##{i}")
  j = 0
  shuffled = dish_names.shuffle
  while (j < 10)
    my_dish = Dish.create(name: shuffled[j])
    my_dish.restaurant = my_restaurant
    my_dish.save
    j += 1    
  end
  i += 1
end

