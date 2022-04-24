puts 'Generating Seeds...'

puts 'Creating Items'
item_names = %w[phone watch printer skateboard pencil book earphones]
item_names.each do |item_name|
  Item.create!(name: item_name.capitalize)
end
puts 'Done'


puts 'Creating Wearhouses'
locations = %w[Montreal Ottawa Toronto]
locations.each_with_index do |location, index|
  Warehouse.create!(name: "Warehouse #{index + 1}", location: location)
end
puts 'Done'

puts 'Adding Items to different Wearhouses'
warehouse_items = [
  [item_names[0], locations[0], rand(1...50)],
  [item_names[0], locations[1], rand(1...50)],
  [item_names[1], locations[2], rand(1...50)],
  [item_names[1], locations[0], rand(1...50)],
  [item_names[2], locations[1], rand(1...50)],
  [item_names[2], locations[2], rand(1...50)],
  [item_names[3], locations[0], rand(1...50)],
  [item_names[3], locations[1], rand(1...50)],
  [item_names[4], locations[2], rand(1...50)],
  [item_names[4], locations[0], rand(1...50)],
  [item_names[5], locations[1], rand(1...50)],
  [item_names[5], locations[2], rand(1...50)],
  [item_names[6], locations[0], rand(1...50)],
  [item_names[6], locations[1], rand(1...50)]
]

pp warehouse_items

warehouse_items.each do |warehouse_item|
  item = Item.find_by(name: warehouse_item[0].capitalize)
  warehouse = Warehouse.find_by(location: warehouse_item[1])
  quantity = warehouse_item[2]
  WarehouseItem.create!(item: item, warehouse: warehouse, quantity: quantity)
end
puts 'Done'

puts 'Finished!'
