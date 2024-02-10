# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: 'Fetches an object given its ID.' do
      argument :id, ID, required: true, description: 'ID of the object.'
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, { null: true }], null: true,
                                                     description: 'Fetches a list of objects given a list of IDs.' do
      argument :ids, [ID], required: true, description: 'IDs of the objects.'
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World!"
    # end

    field :menus, [Types::MenuType], null: false,
                                     description: 'Return a list of menus'

    field :sections, [Types::SectionType], null: false,
                                           description: 'Return a list of sections'

    field :modifier_groups, [Types::ModifierGroupType], null: false,
                                                        description: 'Return a list of modifier groups'

    field :items, [Types::ItemType], null: false,
                                     description: 'Return a list of items'

    field :modifiers, [Types::ModifierType], null: false,
                                             description: 'Return a list of modifiers'

    def menus
      Menu.all
    end

    def sections
      Section.all
    end

    def modifier_groups
      ModifierGroup.all
    end

    def modifiers
      Modifier.all
    end

    def items
      Item.all
    end
  end
end
