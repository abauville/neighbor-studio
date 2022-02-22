class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :default_values

  has_many :studios, dependent: :destroy
  has_many :bookings

  def default_values
    self.name ||= self.email[...self.email.index('@')] # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
  end
end
