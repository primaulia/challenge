class SectionItem < ApplicationRecord
  belongs_to :item
  belongs_to :section, optional: true

  validates :display_order, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
