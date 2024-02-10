module Mutations
  class ApplyModifierToAnItem < Mutations::BaseMutation
    argument :item_id, ID, required: true
    argument :modifier_group_id, ID, required: true

    field :modifier_group, Types::ModifierGroupType
    field :errors, [String], null: false

    def resolve(item_id:, modifier_group_id:)
      # find the item and find the modifier group
      item = Item.find_by(id: item_id)
      modifier_group = ModifierGroup.find_by(id: modifier_group_id)

      if (item.present? && item.component?) && modifier_group.present?
        modifier_group.modifiers << Modifier.new(item:)

        {
          modifier_group:,
          errors: []
        }
      else
        {
          modifier_group: nil,
          errors: ['Item or Modifier Group is not found or can\'t be linked']
        }
      end
    end
  end
end
