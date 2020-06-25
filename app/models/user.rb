class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #many_to_many between hospitals and users         
  has_many :user_hospital_access, dependent: :destroy
  has_many :hospitals, through: :user_hospital_access

end
