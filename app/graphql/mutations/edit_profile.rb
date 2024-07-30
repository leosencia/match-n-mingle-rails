module Mutations
  class EditProfile < BaseMutation
    argument :fname, String, required: false
    argument :lname, String, required: false
    argument :number, String, required: false
    argument :email, String, required: false
    argument :birthdate, String, required: false
    argument :gender, String, required: false
    argument :sexual_orientation, String, required: false
    argument :gender_interest, String, required: false
    argument :location_country, String, required: false
    argument :location_region, String, required: false
    argument :location_city, String, required: false
    argument :school, String, required: false
    argument :bio, String, required: false
    argument :profile_picture, String, required: false
    argument :password, String, required: false
    argument :password_confirmation, String, required: false

    type Types::UserType

    def resolve(**attributes)
      profile_picture_data = attributes.delete(:profile_pic)

      user = User.find(context[:current_user].id)
      user.update!(attributes)

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
