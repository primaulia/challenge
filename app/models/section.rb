class Section < ApplicationRecord
  has_many :menu_sections
  has_many :menus, through: :menu_sections
end
