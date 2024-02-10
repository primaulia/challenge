module Mutations
  class CreateMenu < Mutations::BaseMutation
    argument :label, String, required: true
    argument :state, String, required: false
    argument :start_date, GraphQL::Types::ISO8601Date, required: false
    argument :end_date, GraphQL::Types::ISO8601Date, required: false

    field :menu, Types::MenuType, null: false
    field :errors, [String], null: false

    def resolve(label:, state: nil, start_date: nil, end_date: nil)
      # Create a new Item instance using the provided arguments
      menu = Menu.new(label:, state:, start_date:, end_date:)

      # Save the item and handle errors
      if menu.save
        {
          menu:,
          errors: []
        }
      else
        {
          menu: nil,
          errors: menu.errors.full_messages
        }
      end
    end
  end
end
