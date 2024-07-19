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
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
