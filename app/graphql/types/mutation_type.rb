module Types
  class MutationType < Types::BaseObject
    field :create_item, resolver: CreateItemMutation
    field :insert_money, resolver: InsertMoneyMutation
    field :refund_money, resolver: RefundMoneyMutation
    field :purchase_item, resolver: PurchaseItemMutation
  end
end
