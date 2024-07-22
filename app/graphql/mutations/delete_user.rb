module Mutations
  class DeleteUser < BaseMutation
    argument :id, ID, required: true

    field :user, Types::UserType, null: true
    field :errors, [ String ], null: false

    def resolve(id:)
      user = User.find(id)
      if user.destroy
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end
