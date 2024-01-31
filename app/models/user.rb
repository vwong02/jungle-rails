class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    # .strip removes whitespaces
    # .downcase makes email all lower case to make search not case-sensitive
    user = find_by(email: email.strip.downcase)
    user && user.authenticate(password) ? user : nil
  end
end
