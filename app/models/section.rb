class Section < ApplicationRecord
  include Identifiable

  has_many :menu_sections
  has_many :menus, through: :menu_sections

  has_many :section_items
  has_many :items, through: :section_items

  before_destroy :destroy_associations
  default_scope { joins(:menu_sections).order('menu_sections.display_order ASC') }

  delegate :products, :components, to: :items

  private

  def destroy_associations
    menu_sections.destroy_all
    section_items.destroy_all
  end
end
