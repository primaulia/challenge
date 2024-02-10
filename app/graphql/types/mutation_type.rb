# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_menu, mutation: Mutations::CreateMenu
    field :create_section, mutation: Mutations::CreateSection
  end
end
