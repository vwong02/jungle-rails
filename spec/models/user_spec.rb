require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_valid
    end

    it 'saves a user with all valid attributes' do
      expect(@user.save).to be true
    end

    it 'validates the presense of first name' do
      @user.first_name = nil
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'validates the presense of last name' do
      @user.last_name = nil
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'validates the presense of email' do
      @user.email = nil
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'validates the presense of password' do
      @user.password = nil
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should not save if password and password_confirmation don't match" do
      @user.password = '12345'
      @user.password_confirmation = 'abcde'
      expect(@user.save).to be false
    end

    it 'email should be unique and not case-sensitive' do
      # Use create instead of new because create checks the save parameters
      User.create(
        first_name: 'Jane',
        last_name: 'Smith',
        email: 'TEST@TEST.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include('Email has already been taken')
    end

    it 'password should have minimum length of 8 characters' do
      new_user = User.new(
        first_name: 'Jane',
        last_name: 'Smith',
        email: 'hello@test.com',
        password: '1234567',
        password_confirmation: '1234567'
      )
      expect(new_user.save).to be false
      expect(new_user.errors.full_messages).to include('Password is too short (minimum is 8 characters)')
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_valid
    end

    it 'returns a user with matching email and password' do
      expect(User.authenticate_with_credentials('test@test.com', 'password')).to eq @user
    end
  end
end
