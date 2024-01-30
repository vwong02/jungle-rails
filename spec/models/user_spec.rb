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

  end
end
