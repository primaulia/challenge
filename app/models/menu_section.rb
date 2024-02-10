class MenuSection < ApplicationRecord
  include DisplayOrderable

  belongs_to :menu
  belongs_to :section, optional: true

  validates :section_id, uniqueness: { scope: :menu_id }
end
