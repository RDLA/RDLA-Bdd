#encoding: utf-8
#Default category for fields
["Pleines", "Intermédiaires herbe", "Intermédiaires forêt hiver", "Intermédiaires forêt automne", "Intermédiaires neige", "Intermédiaires forêt été", "Intermédiaires eau", "Intermédiaires montagne haute", "Intermédiaires montagne", "Intermédiaires montagne hiver", "Intermédiaires glace"].each do |category|
  cat = Category.find_or_initialize_by_name(category)
  cat.save
end
# Default field
field = Field.find_or_initialize_by_filename("Herbe.png")
field.category_id = Category.find 1
field.color = "green"
field.save

# Default map
map = Map.find_or_initialize_by_name("Aurorea")
map.default_field = field if map.default_field.blank?
map.save


#Default Admin if didn't exist
if User::Admin.count == 0
  admin = User::Admin.new
  admin.email = "admin@rdla.fr"
  admin.password = "azerty"
  admin.save
end

