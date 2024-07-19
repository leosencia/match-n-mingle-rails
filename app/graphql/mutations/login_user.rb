module Mutations
  class LoginUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(email:, password:)
      user = User.find_by(email: email)
      if user&.authenticate(password)
        token = JsonWebToken.encode(user_id: user.id)
        { user: user, token: token }
      else
        GraphQL::ExecutionError.new('Invalid email or password')
      end
    end
  end
end
