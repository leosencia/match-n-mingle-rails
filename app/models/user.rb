class User < ApplicationRecord
  has_secure_password
  has_many :swipes, dependent: :destroy
  has_many :matches, dependent: :destroy
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
  validates :bio, length: { maximum: 150 }

  private

  def validate_photos
    errors.add("Can only have up to 4 additional photos") if photos.count > 4
  end
end
