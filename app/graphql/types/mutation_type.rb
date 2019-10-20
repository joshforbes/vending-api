module Types
  class MutationType < Types::BaseObject
    field :create_item, resolver: CreateItemMutation
    field :insert_money, resolver: InsertMoneyMutation
  end
end
