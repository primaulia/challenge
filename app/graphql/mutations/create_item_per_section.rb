module Mutations
  class CreateItemPerSection < Mutations::BaseMutation
    argument :section_id, ID, required: true
    argument :label, String, required: true
    argument :item_type, Types::ItemTypeCategory, required: false

    field :item, Types::ItemType, null: false
    field :errors, [String], null: false

    def resolve(section_id:, label:, item_type: 'product')
      # Create a new section based on the given menu
      section = Section.find(section_id)
      item = Item.new(label:, item_type:)
      section.items << item

      # Save the item and handle errors
      if item.valid?
        {
          item:,
          errors: []
        }
      else
        {
          item: nil,
          errors: item.errors.full_messages
        }
      end
    end
  end
end
