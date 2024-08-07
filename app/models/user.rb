class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  # validates :password, presence: { message: "can't be blank" }, length: { minimum: 6 }
  # validates :password_confirmation, presence: { message: "can't be blank" }

end
