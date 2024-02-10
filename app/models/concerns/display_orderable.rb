module DisplayOrderable
  extend ActiveSupport::Concern

  included do
    validates :display_order, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  end
end
