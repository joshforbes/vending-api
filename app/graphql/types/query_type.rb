module Types
  class QueryType < Types::BaseObject
    field :items, resolver: ItemsQuery
    field :balance, resolver: BalanceQuery
  end
end
