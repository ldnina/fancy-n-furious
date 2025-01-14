class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  has_many :cars, dependent: :destroy
  has_many :car_wishes, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true

  mount_uploader :photo, PhotoUploader
end
