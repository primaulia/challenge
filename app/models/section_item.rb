class SectionItem < ApplicationRecord
  include DisplayOrderable

  belongs_to :item
  belongs_to :section, optional: true

  validates :section_id, uniqueness: { scope: :item_id }

  before_save :set_display_order

  private

  # update display_order based on the last section made for a menu
  def set_display_order
    previous_section_item = self.class.where(section:).order('id DESC').first
    self.display_order = previous_section_item.present? ? previous_section_item.display_order + 1 : 0
  end
end
