class Swipe < ApplicationRecord
  belongs_to :user
  belongs_to :swiped_user, class_name: "User"
end
