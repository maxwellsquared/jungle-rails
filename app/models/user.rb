class User < ApplicationRecord
  
  has_secure_password
  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.downcase.strip)
    @user if @user && @user.authenticate(password)
  end

end
# User id: nil, name: nil, email: nil, password_digest: nil