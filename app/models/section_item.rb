class SectionItem < ApplicationRecord
  include DisplayOrderable

  belongs_to :item
  belongs_to :section, optional: true
end
