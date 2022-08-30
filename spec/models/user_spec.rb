require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # before (:each) do
    # end
  
    it 'Password and password_confirmation fields match' do
      @user = User.new(password: "1234567", password_confirmation: "1234567")
      expect(@user.password).to eq(@user.password_confirmation)
    end

    it 'Email address is unique and not case sensitive' do
      @user = User.new(name: "Gonky", email: "a@a.com", password: "1234567", password_confirmation: "1234567")
      @user.save
      @user_two = User.new(name: "Bonky", email: "A@A.COM", password: "1234567", password_confirmation: "1234567")
      @user_two.save
      expect(@user_two.errors.full_messages).to include('Email has already been taken')
    end

    it 'Should have a password' do
      @user = User.new(password: "1234567", password_confirmation: "1234567")
      expect(@user.password).to be_present
    end

    it 'Should have a name' do
      @user = User.new(name: "Gonky")
      expect(@user.name).to be_present
    end

    it 'Password should have a minimum length' do
      @user = User.new(name: "Bonky", email: "A@A.COM", password: "1234", password_confirmation: "1234")
      @user.save
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
  
  end


  describe '.authenticate_with_credentials' do
    
    it 'Should pass when the correct email and password are entered' do
      @user = User.new(name: "Bonky", email: "a@a.com", password: "123456", password_confirmation: "123456")
      @user.save

      user = User.authenticate_with_credentials('a@a.com', '123456')
      expect(user).to be_present
    end

    it 'Should pass when the email is the wrong case' do
      @user = User.new(name: "Bonky", email: "a@a.com", password: "123456", password_confirmation: "123456")
      @user.save
      
      user = User.authenticate_with_credentials('A@A.COM', '123456')
      expect(user).to be_present
    end
  
    it 'Should fail when the password is wrong' do
      @user = User.new(name: "Bonky", email: "a@a.com", password: "123456", password_confirmation: "123456")
      @user.save
      
      user = User.authenticate_with_credentials('A@A.COM', 'GABAGOOL')
      expect(user).to be_nil
    end

    it 'Should fail when the email is wrong' do
      @user = User.new(name: "Bonky", email: "a@a.com", password: "123456", password_confirmation: "123456")
      @user.save
      
      user = User.authenticate_with_credentials('b@b.net', '123456')
      expect(user).to be_nil
    end
  
  end

end


# User id: nil, name: nil, email: nil, password_digest: nil

#     params.require(:user).permit(:name, :email, :password, :password_confirmation)