# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_menu, mutation: Mutations::CreateMenu
    field :create_section_per_menu, mutation: Mutations::CreateSectionPerMenu
    field :create_modifier_group, mutation: Mutations::CreateModifierGroup
    field :create_item_per_section, mutation: Mutations::CreateItemPerSection
  end
end
