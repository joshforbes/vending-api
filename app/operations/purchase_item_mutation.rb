class PurchaseItemMutation < Types::BaseMutation
  description "Purchase an new item using any pending money and return the change"

  argument :item_id, ID, required: true

  field :item, Outputs::ItemType, null: true
  field :change, [Types::Money], null: true
  field :errors, resolver: Resolvers::Error

  def resolve(item_id:)
    item = Item.find(item_id)
    result = PurchaseItem.new(item).call

    if result.success?
      {item: result.item, change: result.change.map(&:class), errors: []}
    else
      {item: nil, change: nil, errors: result.errors}
    end
  end
end
