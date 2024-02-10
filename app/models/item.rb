class Item < ApplicationRecord
  include Identifiable

  enum :item_type, %i[product component], default: :product, validate: true

  has_many :section_items
  has_many :sections, through: :section_items
  has_many :item_modifier_groups
  has_many :modifier_groups, through: :item_modifier_groups
  has_one :modifier
end
