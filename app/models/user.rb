class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true

  def generate_jwt
    self.update_column(:jwt_key, JWT.encode({id: id, timestamp: Time.now}, ENV['SECRET_KEY']))
  end

  after_save do
    generate_jwt
  end
end
