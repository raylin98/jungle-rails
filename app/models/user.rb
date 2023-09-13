class User < ApplicationRecord
  has_secure_password

  validates :firstname, :lastname, presence: true
  validates :password, length: {minimum: 8}, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end