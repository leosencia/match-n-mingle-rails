module Mutations
  class CreateMatch < BaseMutation
    argument :user_id, ID, required: true
    argument :matched_user_id, ID, required: true

    type Types::MatchType # Assuming you have a MatchType

    def resolve(user_id:, matched_user_id:)
      user = User.find(user_id)
      matched_user = User.find(matched_user_id)

      # Ensure both users are different
      if user == matched_user
        return GraphQL::ExecutionError.new("Users must be different")
      end

      match = Match.create!(
        user: user,
        matched_user: matched_user
      )

      match
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new(e.message)
    end
  end
end
