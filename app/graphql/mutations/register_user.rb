module Mutations
  class RegisterUser < BaseMutation
    argument :fname, String, required: true
    argument :lname, String, required: true
    argument :number, String, required: true
    argument :email, String, required: true
    argument :birthdate, GraphQL::Types::ISO8601Date, required: true
    argument :gender, String, required: true
    argument :sexual_orientation, String, required: true
    argument :gender_interest, String, required: true
    argument :location_country, String, required: true
    argument :location_region, String, required: true
    argument :location_city, String, required: true
    argument :school, String, required: false
    argument :bio, String, required: false
    argument :password, String, required: true
    argument :password_confirmation, String, required: true
    argument :profile_picture, String, required: false

    type Types::UserType

    def resolve(**attributes)
      profile_picture_data = attributes.delete(:profile_picture)

      user = User.new(attributes)
      user.save!

      if profile_picture_data
        decoded_data = Base64.decode64(profile_picture_data.split(',')[1])
        io = StringIO.new(decoded_data)
        user.profile_picture.attach(io: io, filename: 'profile_picture.png', content_type: 'image/png')
      end

      user
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
