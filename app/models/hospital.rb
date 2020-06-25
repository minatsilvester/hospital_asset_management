class Hospital < ApplicationRecord
  #many_to_many between hospitals and users
  has_many :user_hospital_access, dependent: :destroy
  has_many :users, through: :user_hospital_access
end
