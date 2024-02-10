# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_menu, mutation: Mutations::CreateMenu
    field :create_section_per_menu, mutation: Mutations::CreateSectionPerMenu
    field :create_modifier_group, mutation: Mutations::CreateModifierGroup
    field :create_item_per_section, mutation: Mutations::CreateItemPerSection
    field :apply_modifier_group_to_item, mutation: Mutations::ApplyModifierGroupToItem
    field :apply_modifier_to_an_item, mutation: Mutations::ApplyModifierToAnItem
  end
end
