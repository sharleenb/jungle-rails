require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it 'should show error is password and password confirmation do not match' do
      @user = User.new
      @user.password = 'test123'
      @user.password_confirmation = 'test321'
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should show error is email is not unique' do
      @user1 = User.new(first: 'Sharleen', last: 'Beniamin', email: 'sharleenb16@gmail.com', password: 'test321', password_confirmation: 'test321')
      @user1.save
      @user2 = User.new(first: 'Shar', last: 'Beniamin', email: 'sharleenb16@gmail.com', password: 'test321', password_confirmation: 'test321')
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should show error if email not entered' do
      @user = User.new(first: 'Sharleen', last: 'Beniamin', email: '', password: 'test321', password_confirmation: 'test321')
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should show error if first name not entered' do
      @user = User.new(first: '', last: 'Beniamin', email: 'sharleenb16@gmail.com', password: 'test321', password_confirmation: 'test321')
      @user.save
      expect(@user.errors.full_messages).to include("First can't be blank")
    end

    it 'should show error if last name not entered' do
      @user = User.new(first: 'Sharleen', last: '', email: 'sharleenb16@gmail.com', password: 'test321', password_confirmation: 'test321')
      @user.save
      expect(@user.errors.full_messages).to include("Last can't be blank")
    end

    it'should show error if password is not more than 5 characters' do
      @user = User.new(first: 'Sharleen', last: 'Beniamin', email: 'sharleenb16@gmail.com', password: 'test3', password_confirmation: 'test3')
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

  end

  describe '.authenticate_with_credentials' do
    it 'should only log in successfully if credentials are valid' do
      @user = User.new(first: 'Shar', last: 'Beniamin', email: 'sharleenb16@gmail.com', password: 'test321', password_confirmation: 'test321')
      @user.save
      @user_logged_in = User.authenticate_with_credentials('sharleenb16@gmail.com', 'test321')
      expect(@user_logged_in).to_not eq(nil)
    end

    it 'should log in successfully even if there are trailing spaces in email address' do
      @user = User.new(first: 'Shar', last: 'Beniamin', email: ' sharleenb16@gmail.com', password: 'test321', password_confirmation: 'test321')
      @user.save
      @user_logged_in = User.authenticate_with_credentials(' sharleenb16@gmail.com', 'test321')
      expect(@user_logged_in).to_not eq(nil)
    end

    it 'should log in successfully regardless of case in email address' do
      @user = User.new(first: 'Shar', last: 'Beniamin', email: 'SHARleenb16@gmail.com', password: 'test321', password_confirmation: 'test321')
      @user.save
      @user_logged_in = User.authenticate_with_credentials('SHARleenb16@gmail.com', 'test321')
      expect(@user_logged_in).to_not eq(nil)
    end

  end
  
end
