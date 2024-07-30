module Mutations
  class CreateSwipe < BaseMutation
    argument :user_id, ID, required: true
    argument :swiped_user_id, ID, required: true
    argument :liked_back, Boolean, required: false

    type Types::SwipeType

    def resolve(user_id:, swiped_user_id:, liked_back: nil)
      user = User.find(user_id)
      swiped_user = User.find(swiped_user_id)

      swipe = Swipe.create!(
        user: user,
        swiped_user: swiped_user,
        liked_back: liked_back
      )

      swipe
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new(e.message)
    end
  end
end
