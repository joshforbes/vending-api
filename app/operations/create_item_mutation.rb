class CreateItemMutation < Types::BaseMutation
  description "Create a new item"

  argument :name, String, required: true
  argument :cost, Integer, required: true

  field :item, Outputs::ItemType, null: true
  field :errors, resolver: Resolvers::Error

  def resolve(input)
    item = Item.new(input.to_h)

    if item.save
      {item: item, errors: []}
    else
      {item: nil, errors: item.errors}
    end
  end
end
