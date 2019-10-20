module Types
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    def self.graphql_name
      super.chomp("Mutation")
    end
  end
end
