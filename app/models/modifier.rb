class Modifier < ApplicationRecord
  include DisplayOrderable

  belongs_to :item
  belongs_to :modifier_group

  validates :default_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
