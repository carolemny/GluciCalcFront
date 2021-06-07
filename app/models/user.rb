class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
  has_many :properties

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
