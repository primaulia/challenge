require 'rest-client'

Menu.destroy_all
Section.destroy_all
Item.delete_all
ModifierGroup.destroy_all

puts 'Creating menus 🍳'
menu1 = Menu.create!(label: 'Pizza Menu')
menu2 = Menu.create!(label: 'Drinks Menu')

puts 'Creating sections 🗒️'
section1 = menu1.sections.create!(label: 'Classic Pizzas', description: 'This is a section about Classic Pizzas')
section2 = menu1.sections.create!(label: 'Gourmet Pizzas', description: 'This is a section about Gourmet Pizzas',
                                  available: false)
section3 = menu2.sections.create!(label: 'Soft Drinks', description: 'This is for the softie')
section4 = menu2.sections.create!(label: 'Alcoholic Drinks', description: 'This is for the haram')

puts 'Creating product items 🍔'
section_one_products = ['Margherita Pizza', 'Pepperoni Pizza']
section_two_products = ['Hawaiian Pizza']
section_three_products = ['Coca-Cola']
section_four_products = %w[Beer Wine]

section_one_products.each do |product|
  url = "https://pixabay.com/api/?key=42454135-baff0b2d7d0390ff75be2a8eb&q=#{product.downcase.split(' ').join('+')}&image_type=photo&safesearch=true"
  response = JSON.parse(RestClient.get(url))
  image_url = response['hits'].first['webformatURL']

  section1.items.create!(
    label: product,
    item_type: :product,
    description: Faker::Food.description,
    price: rand(1..25) + 0.99,
    available: [true, false].sample,
    image_url:
  )
end

section_two_products.each do |product|
  url = "https://pixabay.com/api/?key=42454135-baff0b2d7d0390ff75be2a8eb&q=#{product.downcase.split(' ').join('+')}&image_type=photo&safesearch=true"
  response = JSON.parse(RestClient.get(url))
  image_url = response['hits'].first['webformatURL']

  section2.items.create!(
    label: product,
    item_type: :product,
    description: Faker::Food.description,
    price: rand(1..25) + 0.99,
    available: [true, false].sample,
    image_url:
  )
end

section_three_products.each do |product|
  url = "https://pixabay.com/api/?key=42454135-baff0b2d7d0390ff75be2a8eb&q=#{product.downcase.split(' ').join('+')}&image_type=photo&safesearch=true"
  response = JSON.parse(RestClient.get(url))
  image_url = response['hits'].first['webformatURL']

  section3.items.create!(
    label: product,
    item_type: :product,
    description: Faker::Food.description,
    price: rand(1..25) + 0.99,
    available: [true, false].sample,
    image_url:
  )
end

section_four_products.each do |product|
  url = "https://pixabay.com/api/?key=42454135-baff0b2d7d0390ff75be2a8eb&q=#{product.downcase.split(' ').join('+')}&image_type=photo&safesearch=true"
  response = JSON.parse(RestClient.get(url))
  image_url = response['hits'].first['webformatURL']

  section4.items.create!(
    label: product,
    item_type: :product,
    description: Faker::Food.description,
    price: rand(1..25) + 0.99,
    available: [true, false].sample,
    image_url:
  )
end

# item1 = section1.items.create!(label: 'Margherita Pizza', item_type: :product, price: 12.99,
#                                available: [true, false].sample, image_url: Faker::LoremFlickr.image(size: '480x480', search_terms: %w[Food Margherita-Pizza]))
# item2 = section1.items.create!(label: 'Pepperoni Pizza', item_type: :product, price: 13.99,
#                                available: [true, false].sample, image_url: Faker::LoremFlickr.image(size: '480x480', search_terms: %w[Food Pepperoni-Pizza]))
# item3 = section2.items.create!(label: 'Hawaiian Pizza', item_type: :product, price: 14.99,
#                                available: [true, false].sample, image_url: Faker::LoremFlickr.image(size: '480x480', search_terms: %w[Food Hawaiian-Pizza]))
# item4 = section3.items.create!(label: 'Coca-Cola', item_type: :product, price: 2.50, available: [true, false].sample,
#                                image_url: Faker::LoremFlickr.image(size: '480x480', search_terms: %w[Food Coca-Cola]))
# item5 = section3.items.create!(label: 'Sprite', item_type: :product, price: 2.50, available: [true, false].sample,
#                                image_url: Faker::LoremFlickr.image(size: '480x480', search_terms: %w[Drink Sprite]))
# item6 = section4.items.create!(label: 'Beer', item_type: :product, price: 5.00, available: [true, false].sample,
#                                image_url: Faker::LoremFlickr.image(size: '480x480', search_terms: %w[Drink Beer]))
# item7 = section4.items.create!(label: 'Wine', item_type: :product, price: 6.00, available: [true, false].sample,
#                                image_url: Faker::LoremFlickr.image(size: '480x480', search_terms: %w[Drink Wine]))

puts 'Creating component items 📏'
ten_inch_pizza = section1.items.create!(label: '10" Pizza', item_type: :component, price: 0.00)
twelve_inch_pizza = section1.items.create!(label: '12" Pizza', item_type: :component, price: 1.00)
regular_crust_pizza = section1.items.create!(label: 'Regular Crust Pizza', item_type: :component, price: 0.00)
thicc_crust_pizza = section1.items.create!(label: 'Stuffed Crust Pizza', item_type: :component, price: 1.00)
garlic_butter_sauce = section2.items.create!(label: 'Garlic Butter Sauce', item_type: :component, price: 0.50)
tomato_sauce = section2.items.create!(label: 'Tomato Sauce', item_type: :component, price: 0.50)

puts 'Create modifier groups ✏️'
modifier_group1 = ModifierGroup.create!(label: 'Pizza Size', selection_required_min: 1, selection_required_max: 1)
modifier_group2 = ModifierGroup.create!(label: 'Pizza Crust', selection_required_min: 1, selection_required_max: 1)
modifier_group3 = ModifierGroup.create!(label: 'Pizza Sauce', selection_required_min: 1, selection_required_max: 1)

# puts 'Create item modifier groups 🙌'
# item1.modifier_groups << modifier_group1
# item2.modifier_groups << modifier_group1
# item3.modifier_groups << modifier_group1
# item1.modifier_groups << modifier_group2
# item2.modifier_groups << modifier_group2
# item3.modifier_groups << modifier_group2
# item1.modifier_groups << modifier_group3
# item2.modifier_groups << modifier_group3
# item3.modifier_groups << modifier_group3

# puts 'Create modifiers 🚀'
# modifier1 = modifier_group1.modifiers.create(item: ten_inch_pizza)
# modifier2 = modifier_group1.modifiers.create(item: twelve_inch_pizza)
# modifier3 = modifier_group2.modifiers.create(item: regular_crust_pizza)
# modifier4 = modifier_group2.modifiers.create(item: thicc_crust_pizza)
# modifier5 = modifier_group3.modifiers.create(item: tomato_sauce)
# modifier6 = modifier_group3.modifiers.create(item: garlic_butter_sauce)
