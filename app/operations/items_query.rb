class ItemsQuery < Types::BaseResolver
  description "Gets all the items"
  type Outputs::ItemType.connection_type, null: false

  def resolve
    Item.all
  end
end
