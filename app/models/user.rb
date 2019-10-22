class User < ActiveRecord::Base
  
  has_secure_password
  
  validates :name, length: { minimum: 4 }, presence: true, uniqueness: { case_sensitive: true }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 6..20 }, confirmation: true
  validates :password_confirmation, presence: true
  
  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.strip.downcase)
    if user && user.authenticate(password)
      user
    end
  end

end
