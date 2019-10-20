module Types
  class Money < Types::BaseEnum
    graphql_name "MoneyType"
    description "A representation of currency"

    value "QUARTER", value: Quarter
  end
end
