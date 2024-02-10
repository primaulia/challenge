module Mutations
  class CreateModifierGroup < Mutations::BaseMutation
    argument :label, String, required: true
    argument :selection_required_min, Integer, required: false
    argument :selection_required_max, Integer, required: false

    field :modifier_group, Types::ModifierGroupType
    field :errors, [String], null: false

    def resolve(label:, selection_required_min: 1, selection_required_max: 1)
      # Create a new Item instance using the provided arguments
      modifier_group = ModifierGroup.new(label:, selection_required_min:, selection_required_max:)

      # Save the item and handle errors
      if modifier_group.save
        {
          modifier_group:,
          errors: []
        }
      else
        {
          modifier_group: nil,
          errors: mod_group.errors.full_messages
        }
      end
    end
  end
end
