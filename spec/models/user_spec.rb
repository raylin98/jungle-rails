require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here
    it "is valid with first name, last name, email and password" do
      @user = User.new(
        {firstname: "test",
        lastname: "test",
        email: "test@test.com",
        password: "password",
        password_confirmation: "password"
      })
      expect(@user).to be_valid
  end

    it "is not valid without first name" do
        @user = User.new(
          {firstname: nil,
          lastname: "test",
          email: "test@test.com",
          password: "password",
          password_confirmation: "password"
        })
        expect(@user).to_not be_valid
    end

    it "is not valid without last name" do
      @user = User.new(
        {firstname: "test",
        lastname: nil,
        email: "test@test.com",
        password: "password",
        password_confirmation: "password"
      })
      expect(@user).to_not be_valid
    end

    it "is not valid without email" do
      @user = User.new(
        {firstname: "test",
        lastname: "test",
        email: nil,
        password: "password",
        password_confirmation: "password"
      })
      expect(@user).to_not be_valid
    end

    it "is not valid if email already exists" do
      @user = User.new(
        {firstname: "test",
        lastname: "test",
        email: "test@test.com",
        password: "password",
        password_confirmation: "password"
      })
      @user.save

      @user2 = User.new(
        {firstname: "test2",
        lastname: "test2",
        email: "test@test.com",
        password: "password",
        password_confirmation: "password"
      })
      expect(@user2).to_not be_valid
    end

    it "is not valid if password is empty" do
      @user = User.new(
        {firstname: "test",
        lastname: "test",
        email: "test@test.com",
        password: nil,
        password_confirmation: "password"
      })
      expect(@user).to_not be_valid
    end

    it "is not valid if passwords do not match" do
      @user = User.new(
        {firstname: "test",
        lastname: "test",
        email: "test@test.com",
        password: "password",
        password_confirmation: "wrongpass"
      })
      expect(@user).to_not be_valid
    end

    it "is not valid if password is less than 8 characters" do
      @user = User.new(
        {firstname: "test",
        lastname: "test",
        email: "test@test.com",
        password: "pass",
        password_confirmation: "pass"
      })
      expect(@user).to_not be_valid
    end
end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "returns user if matching credentials" do
      user = User.create(
        {firstname: "test",
        lastname: "test",
        email:"test@test.com",
        password: "password",
        password_confirmation: "password"
      })
      result = User.authenticate_with_credentials("test@test.com", "password")
      expect(result).to eq(user)
    end

    it "returns nil if incorrect password" do
      user = User.create(
        {firstname: "test",
        lastname: "test",
        email: "test@test.com",
        password: "password",
        password_confirmation: "password"
      })
      result = User.authenticate_with_credentials("test@test.com", "1234")
      expect(result).to_not eq(user)
    end

    it "returns user if user adds spaces in their email submission" do
      user = User.create(
        {firstname: "test",
        lastname: "test",
        email: "test@test.com",
        password: "password",
        password_confirmation: "password"
      })
      result = User.authenticate_with_credentials("test@test.com", "password")
      expect(result).to eq(user)
    end

    it "returns user regardless of casing in email" do
      user = User.create(
        {firstname: "test",
        lastname: "test",
        email: "test@test.com",
        password: "password",
        password_confirmation: "password"
      })
      result = User.authenticate_with_credentials("TeSt@TEST.cOm", "password")
      expect(result).to eq(user)
    end
    
  end
end