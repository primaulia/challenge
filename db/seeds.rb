require 'rest-client'

Menu.destroy_all
Section.destroy_all
Item.delete_all
ModifierGroup.destroy_all

puts 'Creating menus 🍳'
menu1 = Menu.create!(label: 'Pizza Menu')
menu2 = Menu.create!(label: 'Drinks Menu')

puts 'Creating sections 🗒️'
section1 = menu1.sections.create!(label: 'Classic Pizzas',
                                  description: 'Here is our selection of our favourite dishes 🍕')
section2 = menu1.sections.create!(label: 'Gourmet Pizzas',
                                  description: 'Indulge your taste buds with our seasonal pizzas 🇮🇹', available: false)
section5 = menu1.sections.create!(label: 'Pastas', description: 'Noodles but make it Italian 🍝', available: false)

section3 = menu2.sections.create!(label: 'Soft Drinks')
section4 = menu2.sections.create!(label: 'Alcoholic Drinks')
puts 'Creating product items 🍔'
section_one_products = ['Margherita Pizza', 'Pepperoni Pizza', 'Mushroom Pizza',
                        'Four Cheese Pizza']
section_two_products = ['Hawaiian Pizza', 'Spinach Artichoke Pizza', 'Prosciutto e Funghi Pizza',
                        'Quattro Stagioni Pizza']
section_pasta_products = ['Spaghetti Bolognaise', 'Penne Arrabbiata Pasta', 'Fettuccine Alfredo', 'Carbonara Pasta', 'Aglio Olio Pasta',
                          'Spaghetti alle Vongole', 'Seafood Alfredo', 'Pasta Primavera']
section_three_products = ['Coca-Cola', 'Ginger Ale', 'Iced Lemon Tea', 'Cappuccino', 'Hot Tea']
section_four_products = ['Beer', 'Red Wine', 'White Wine', 'Aperol', 'Limoncello', 'Campari']

section_one_products.each do |product|
  url = "https://pixabay.com/api/?key=42454135-baff0b2d7d0390ff75be2a8eb&q=#{product.downcase.split(' ').join('+')}&image_type=photo&safesearch=true"
  response = JSON.parse(RestClient.get(url))
  image_url = response['hits']&.first&.[]('webformatURL')

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
  image_url = response['hits']&.first&.[]('webformatURL')

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
  image_url = response['hits']&.first&.[]('webformatURL')

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
  image_url = response['hits']&.first&.[]('webformatURL')

  section4.items.create!(
    label: product,
    item_type: :product,
    description: Faker::Food.description,
    price: rand(1..25) + 0.99,
    available: [true, false].sample,
    image_url:
  )
end

section_pasta_products.each do |product|
  url = "https://pixabay.com/api/?key=42454135-baff0b2d7d0390ff75be2a8eb&q=#{product.downcase.split(' ').join('+')}&image_type=photo&safesearch=true"
  response = JSON.parse(RestClient.get(url))
  image_url = response['hits']&.first&.[]('webformatURL')

  section5.items.create!(
    label: product,
    item_type: :product,
    description: Faker::Food.description,
    price: rand(1..25) + 0.99,
    available: [true, false].sample,
    image_url:
  )
end

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
