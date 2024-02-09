class ModifierGroup < ApplicationRecord
  include Identifiable

  has_many :modifiers, dependent: :destroy

  validates :selection_required_min, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :selection_required_max, presence: true,
                                     numericality: { only_integer: true, greater_than_or_equal_to: :selection_required_min }
end
