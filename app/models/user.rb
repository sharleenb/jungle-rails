class User < ApplicationRecord

  has_secure_password
  
  validates :first, presence: true
  validates :last, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
  # validates :password_confirmation, presence: true

  before_create :format_email

  def self.authenticate_with_credentials(email, password)
    @email = email.strip
    @email_lowercase = @email.downcase
    @user = User.find_by_email(@email_lowercase)

    if @user.authenticate(password)
      @user
    else
      nil
    end
  end

  private

  def format_email
    self.email = email.strip
    self.email = self.email.downcase
  end
end
