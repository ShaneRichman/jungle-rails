require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user1 = User.new
      @user1.first_name = "Shane"
      @user1.last_name = "Richman"
      @user1.email = "shane@shane.shane"
      @user1.password = "shane"
      @user1.password_confirmation = "shane"
      @user1.save
    end

    it 'should validate with full specs' do
      expect(@user1).to be_valid
    end
    it 'should not validate without a first name' do
      @user1.first_name = nil
      expect(@user1).not_to be_valid
    end
    it 'should not validat ewithout a last name' do
      @user1.last_name = nil
      expect(@user1).not_to be_valid
    end
    it 'should not validate without an email' do
      @user1.email = nil
      expect(@user1).not_to be_valid
    end
    it 'should not validate without a password' do
      @user1.password = nil
      expect(@user1).not_to be_valid
    end
    it 'should not validate without a password password_confirmation' do
      @user1.password_confirmation = nil
      expect(@user1).not_to be_valid
    end
    it 'should not validate with different password_confirmation' do
      @user1.password_confirmation = "not shane"
      expect(@user1).not_to be_valid
    end
    it 'should not validate without a password digest' do
      @user1.password_digest = nil
      expect(@user1).not_to be_valid
    end
    it 'should not validate with same emails and case insensative' do
      @user2 = User.new
      @user2.first_name = "Steve"
      @user2.last_name = "Smith"
      @user2.email = "Shane@Shane.Shane"
      @user2.password = "steve"
      @user2.password_confirmation = "steve"
      @user2.save
      expect(@user2).not_to be_valid
    end
    it 'should not validate when password is less than 5 characters' do
      @user1.password = 'shoe'
      @user1.password_confirmation = 'shoe'
      @user1.save
      expect(@user1).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do

  end
end