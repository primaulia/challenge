class Item < ApplicationRecord
  has_many :section_items
  has_many :sections, through: :section_items

  enum :item_type, %i[product component], default: :product

  # Define methods or scopes based on type if needed
  def product?
    item_type == 'product'
  end

  def component?
    item_type == 'component'
  end
end
