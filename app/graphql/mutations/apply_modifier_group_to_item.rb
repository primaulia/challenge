module Mutations
  class ApplyModifierGroupToItem < Mutations::BaseMutation
    argument :item_id, ID, required: true
    argument :modifier_group_id, ID, required: true

    field :item, Types::ItemType
    field :errors, [String], null: false

    def resolve(item_id:, modifier_group_id:)
      # find the item and find the modifier group
      item = Item.find_by(id: item_id)
      modifier_group = ModifierGroup.find_by(id: modifier_group_id)

      if (item.present? && item.product?) && modifier_group.present?
        item.modifier_groups << modifier_group

        {
          item:,
          errors: []
        }
      else
        {
          item: nil,
          errors: ['Item or Modifier Group is not found or can\'t be linked']
        }
      end
    end
  end
end
