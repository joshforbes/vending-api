module Types
  class MutationType < Types::BaseObject
    field :create_item, resolver: CreateItemMutation
  end
end
