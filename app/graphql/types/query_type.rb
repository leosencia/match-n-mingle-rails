# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :total_users, Integer, null: false, description: "Total number of users in the database"

    def total_users
      User.where(admin: false).count
    end

    field :total_matches, Integer, null: false, description: "Total number of matches in the database"

    def total_matches
      Match.count
    end

    field :total_swipes, Integer, null: false, description: "Total number of swipes in the database"

    def total_swipes
      Swipe.count
    end

    field :all_users, [ Types::UserType ], null: false, description: "All users in the database"

    def all_users
      User.where(admin: false)
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    rescue ActiveRecord::RecordNotFound => e
      GraphQL::ExecutionError.new("User not found")
    end

    field :swipes_by_user, [Types::SwipeType], null: false do
      argument :user_id, ID, required: true
    end

    def swipes_by_user(user_id:)
      User.find(user_id).swipes
    rescue ActiveRecord::RecordNotFound => e
      GraphQL::ExecutionError.new("User not found")
    end


    field :all_swipes, [ Types::SwipeType ], null: false, description: "All swipes in the database"

    def all_swipes
      Swipe.all
    end

  end
end
