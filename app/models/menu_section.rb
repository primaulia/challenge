class MenuSection < ApplicationRecord
  include DisplayOrderable

  belongs_to :menu
  belongs_to :section, optional: true
end
