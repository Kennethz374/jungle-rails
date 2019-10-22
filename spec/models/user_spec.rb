require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should have error "Password can not be blank" if password is nil' do
      @user = User.create(name:"Kennnnn", email: "123@123", password: nil, password_confirmation: "12312312")
      expect(@user.password).not_to be_present
      expect(@user.errors.full_messages).to be_present
    end

    it 'should have error "name can not be blank" if name is nil' do
      @user = User.create(name:nil, email: "123@123", password: "sdfasdfas", password_confirmation: "12312312")
      expect(@user.name).not_to be_present
      expect(@user.errors.full_messages).to be_present
    end

    it 'should have error "password_confirmation can not be blank" if password_confirmation is nil' do
      @user = User.create(name:"kkkkkkk", email: "123@123", password: "sdfasdfas", password_confirmation: nil)
      expect(@user.password_confirmation).not_to be_present
      expect(@user.errors.full_messages).to be_present
    end

    it 'should have error "email can not be blank" if email is nil' do
      @user = User.create(name:"kkkkkkk", email: nil, password: "sdfasdfas", password_confirmation: nil)
      expect(@user.email).not_to be_present
      expect(@user.errors.full_messages).to be_present
    end

  end

  describe '.authenticate_with_credentials' do
    it 'should return an instance of user when email exists in the db' do
      @user = User.create(name:"kkkkkkk", email: "123@123", password: "sdfasdfas", password_confirmation: "sdfasdfas")
      @user1 = User.authenticate_with_credentials(@user.email, @user.password)
      expect(@user1).to have_attributes(:email => "123@123")
    end

    it 'should return nil when email does not exist in the db' do
      @user = User.create(name:"kkkkkkk", email: "123@123", password: "sdfasdfas", password_confirmation: "sdfasdfas")
      @user1 = User.authenticate_with_credentials("testing@testin.com", "sdfasdfas")
      expect(@user1).to be_nil
    end

    it 'should allow user to login with different cases' do
      @user = User.create(name:"kkkkkkk", email: "aaaabcd@abcd.com", password: "sdfasdfas", password_confirmation: "sdfasdfas")
      @user1 = User.authenticate_with_credentials("AAAAbcd@abcd.com", "sdfasdfas")
      expect(@user1).to have_attributes(:email => "aaaabcd@abcd.com")
    end

    it 'should allow user to login with space ' do
      @user = User.create(name:"kkkkkkk", email: "aaaabcd@abcd.com", password: "sdfasdfas", password_confirmation: "sdfasdfas")
      @user1 = User.authenticate_with_credentials("  AAAAbcd@abcd.com", "sdfasdfas")
      expect(@user1).to have_attributes(:email => "aaaabcd@abcd.com")
    end
  end
end
