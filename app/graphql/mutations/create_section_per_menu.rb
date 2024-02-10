module Mutations
  class CreateSectionPerMenu < Mutations::BaseMutation
    argument :menu_id, ID, required: true
    argument :label, String, required: true

    field :section, Types::SectionType, null: false
    field :errors, [String], null: false

    def resolve(menu_id:, label:)
      # Create a new section based on the given menu
      menu = Menu.find(menu_id)
      section = Section.new(label:)
      menu.sections << section

      # Save the item and handle errors
      if section.valid?
        {
          section:,
          errors: []
        }
      else
        {
          section: nil,
          errors: section.errors.full_messages
        }
      end
    end
  end
end
