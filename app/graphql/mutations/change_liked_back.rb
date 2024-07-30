module Mutations
  class ChangeLikedBack < BaseMutation
    argument :id, ID, required: true
    argument :liked_back, Boolean, required: true

    type Types::SwipeType

    def resolve(id:, liked_back:)
      swipe = Swipe.find(id)
      swipe.update!(liked_back: liked_back)

      swipe
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new("Swipe does not exist")
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new(e.message)
    end
  end
end
