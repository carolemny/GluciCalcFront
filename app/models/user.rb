class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  has_many :meals, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
   end
   
   def password_token_valid?
    (self.reset_password_sent_at + 4.hours) > Time.now.utc
   end
   
   def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    save!
   end
   
   private
   
   def generate_token
    SecureRandom.hex(10)
   end
end
