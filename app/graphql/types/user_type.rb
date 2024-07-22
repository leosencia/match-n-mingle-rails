# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :fname, String
    field :lname, String
    field :number, String
    field :email, String
    field :birthdate, GraphQL::Types::ISO8601Date
    field :gender, String
    field :sexual_orientation, String
    field :gender_interest, String
    field :location_country, String
    field :location_region, String
    field :location_city, String
    field :school, String
    field :bio, String
    field :password, String
    field :password_confirmation, String
    field :profile_picture, String
    field :profile_picture_url, String
    field :admin, Boolean
    field :swipes, [Types::SwipeType], null: true
    field :matches, [Types::MatchType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def profile_picture_url
      if object.profile_picture.attached?
        object.profile_picture.url
      else
        nil
      end
    end
  end
end
