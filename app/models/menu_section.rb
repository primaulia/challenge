class MenuSection < ApplicationRecord
  include DisplayOrderable

  belongs_to :menu
  belongs_to :section, optional: true

  validates :section_id, uniqueness: { scope: :menu_id }

  before_save :set_display_order

  private

  # update display_order based on the last section made for a menu
  def set_display_order
    previous_menu_section = self.class.where(menu:).order('id DESC').first
    self.display_order = previous_menu_section.present? ? previous_menu_section.display_order + 1 : 0
  end
end
