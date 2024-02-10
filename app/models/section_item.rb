class SectionItem < ApplicationRecord
  include DisplayOrderable

  belongs_to :item
  belongs_to :section, optional: true

  validates :section_id, uniqueness: { scope: :item_id }
end
