class ItemsQuery < Types::BaseResolver
  description "Gets all the items"
  type Outputs::ItemType.connection_type, null: false

  def resolve
    Item.one_of_each
  end
end
