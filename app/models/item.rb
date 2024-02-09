class Item < ApplicationRecord
  include Identifiable

  enum :item_type, %i[product component], default: :product

  has_many :section_items
  has_many :sections, through: :section_items
  has_many :item_modifier_groups

  validates :type, inclusion: { in: %w[product component] }

  # Define methods or scopes based on type if needed
  def product?
    item_type == 'product'
  end

  def component?
    item_type == 'component'
  end
end
