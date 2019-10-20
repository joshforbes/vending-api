module Types
  class QueryType < Types::BaseObject
    field :items, resolver: ItemsQuery
  end
end
