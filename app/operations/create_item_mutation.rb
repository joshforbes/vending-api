class CreateItemMutation < Types::BaseMutation
  description "Create a new item"

  argument :name, String, required: true

  field :item, Outputs::ItemType, null: true
  field :errors, resolver: Resolvers::Error

  def resolve(input)
    item = Item.new(input.to_h)

    if item.save
      {item: item, errors: []}
    else
      {item: nil, errors: result.errors}
    end
  end
end
