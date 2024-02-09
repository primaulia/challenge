class Section < ApplicationRecord
  has_many :menu_sections
  has_many :menus, through: :menu_sections

  has_many :section_items
  has_many :items, through: :section_items

  validates :label, :identifier, presence: true

  before_destroy :destroy_associations

  def destroy_associations
    menu_sections.destroy_all
    section_items.destroy_all
  end
end
