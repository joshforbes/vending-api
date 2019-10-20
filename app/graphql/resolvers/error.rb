module Resolvers
  class Error < Types::BaseResolver
    graphql_name "Error"
    type [Types::ErrorType], null: false
    description "Validation error"

    def resolve
      map_errors(object[:errors])
    end

    private

    def map_errors(errors)
      case errors
      when ActiveModel::Errors
        errors.map { |field, message| {field: field, message: message} }
      else
        errors.map { |error| {field: :base, message: error} }
      end
    end
  end
end
