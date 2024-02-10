module Types
  class ItemTypeCategory < Types::BaseEnum
    value 'product', 'An item thas is sold individually not part of an item modification'
    value 'component', 'An item thas is sold together as part of the item modification'
  end
end
