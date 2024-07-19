class User < ApplicationRecord
  has_secure_password
  has_many :swipes
  has_many :matches
  has_many :received_swipes, class_name: "Swipe", foreign_key: "swiped_user_id"
  has_one_attached :profile_picture
  has_many_attached :photos

  validate :validate_photos

  validates :email, presence: true, uniqueness: true
  validates :fname, presence: true
  validates :lname, presence: true
  validates :number, presence: true
  validates :birthdate, presence: true
  validates :gender, presence: true
  validates :sexual_orientation, presence: true
  validates :gender_interest, presence: true
  validates :location_country, presence: true
  validates :location_region, presence: true
  validates :location_city, presence: true
  validates :profile_picture, presence: true

  private

  def validate_photos
    errors.add("Can only have up to 4 additional photos") if photos.count > 4
  end
end

# User.create(fname:"Michael", lname:"Hartl", number:"09123456789", email:"mikehartl@gmail.com", birthdate:"1972-06-17", gender:"Male", sexual_orientation:"Male", gender_interest:"Male", location_country:"Philippines", location_region:"Bicol", location_city:"Sorsogon", password:"password123", password_confirmation:"password123")
