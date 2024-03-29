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

    # Collection queries
    field :menus, [Types::MenuType], null: false,
                                     description: 'Return a list of menus'

    field :sections, [Types::SectionType], null: false,
                                           description: 'Return a list of sections'

    field :modifier_groups, [Types::ModifierGroupType], null: false,
                                                        description: 'Return a list of modifier groups'

    field :items, [Types::ItemType], null: false,
                                     description: 'Return a list of items'

    field :products, [Types::ItemType], null: false, description: 'Return a list of product items'

    field :components, [Types::ItemType], null: false, description: 'Return a list of component items'

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

    def products
      Item.products
    end

    def components
      Item.components
    end

    # Member queries

    field :menu, Types::MenuType, null: false,
                                  description: 'Return one menu by id' do
                                    argument :id, ID, required: true
                                  end

    field :section, Types::SectionType, null: false,
                                        description: 'Return one section by id' do
      argument :id, ID, required: true
    end

    field :modifier_group, Types::ModifierGroupType, null: false,
                                                     description: 'Return one modifier group by id' do
      argument :id, ID, required: true
    end

    field :item, Types::ItemType, null: false,
                                  description: 'Return one item by id' do
      argument :id, ID, required: true
    end

    def menu(id:)
      Menu.find(id)
    end

    def section(id:)
      Section.find(id)
    end

    def modifier_group(id:)
      ModifierGroup.find(id)
    end

    def item(id:)
      Item.find(id)
    end
  end
end
