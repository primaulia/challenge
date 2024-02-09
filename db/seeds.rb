Menu.destroy_all
Section.destroy_all
Item.delete_all
ModifierGroup.destroy_all

puts 'Creating menus 🍳'
menu1 = Menu.create!(label: 'Pizza Menu')
menu2 = Menu.create!(label: 'Drinks Menu')

puts 'Creating sections 🗒️'
section1 = menu1.sections.create!(label: 'Classic Pizzas', description: 'This is a section about Classic Pizzas')
section2 = menu1.sections.create!(label: 'Gourmet Pizzas', description: 'This is a section about Gourmet Pizzas')
section3 = menu2.sections.create!(label: 'Soft Drinks', description: 'This is for the softie')
section4 = menu2.sections.create!(label: 'Alcoholic Drinks', description: 'This is for the haram')

puts 'Creating product items 🍔'
item1 = section1.items.create!(label: 'Margherita Pizza', item_type: 'product', price: 12.99)
item2 = section1.items.create!(label: 'Pepperoni Pizza', item_type: 'product', price: 13.99)
item3 = section2.items.create!(label: 'Hawaiian Pizza', item_type: 'product', price: 14.99)
item4 = section3.items.create!(label: 'Coca-Cola', item_type: 'product', price: 2.50)
item5 = section3.items.create!(label: 'Sprite', item_type: 'product', price: 2.50)
item6 = section4.items.create!(label: 'Beer', item_type: 'product', price: 5.00)
item7 = section4.items.create!(label: 'Wine', item_type: 'product', price: 6.00)

puts 'Creating component items 📏'
_10_inch_pizza = section1.items.create!(label: '10" Pizza', item_type: 'component', price: 0.00)
_12_inch_pizza = section1.items.create!(label: '12" Pizza', item_type: 'component', price: 1.00)
regular_crust_pizza = section1.items.create!(label: '10" Pizza', item_type: 'component', price: 0.00)
thicc_crust_pizza = section1.items.create!(label: '12" Pizza', item_type: 'component', price: 1.00)
garlic_butter_sauce = section2.items.create!(label: 'Garlic Butter Sauce', item_type: 'component', price: 0.50)
tomato_sauce = section2.items.create!(label: 'Tomato Sauce', item_type: 'component', price: 0.50)

puts 'Create modifier groups ✏️'
modifier_group1 = ModifierGroup.create!(label: 'Size', selection_required_min: 1,
                                        selection_required_max: 1)
modifier_group2 = ModifierGroup.create!(label: 'Crust', selection_required_min: 1,
                                        selection_required_max: 1)
modifier_group3 = ModifierGroup.create!(label: 'Sauce', selection_required_min: 1,
                                        selection_required_max: 1)

puts 'Create modifiers 🚀'
modifier1 = modifier_group1.modifiers.create(item: _10_inch_pizza)
modifier2 = modifier_group1.modifiers.create(item: _12_inch_pizza)
modifier3 = modifier_group2.modifiers.create(item: regular_crust_pizza)
modifier4 = modifier_group2.modifiers.create(item: thicc_crust_pizza)
modifier5 = modifier_group3.modifiers.create(item: tomato_sauce)
modifier6 = modifier_group3.modifiers.create(item: garlic_butter_sauce)
