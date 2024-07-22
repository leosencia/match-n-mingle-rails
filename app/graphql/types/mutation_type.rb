# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :register_user, mutation: Mutations::RegisterUser
    field :login_user, mutation: Mutations::LoginUser
    field :generate_presigned_url, mutation: Mutations::GeneratePresignedUrl
    field :delete_user, mutation: Mutations::DeleteUser
    field :create_swipe, mutation: Mutations::CreateSwipe
    field :create_match, mutation: Mutations::CreateMatch
    field :change_liked_back, mutation: Mutations::ChangeLikedBack
  end
end
