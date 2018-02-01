require 'rails_helper'

RSpec.describe User do

  let!(:user) { User.new }
  context 'Validation' do
    it 'is valid user' do
      user = User.create!(first_name: 'Harish', last_name: 'Patankar', email: 'harishpatankar@gmail.com', password: '1234567890')
      expect(user.valid?).to eq(true)
    end

    context 'Name Validation' do
      it 'is invalid first_name' do
        user.first_name = ''
        user.save
        expect(user.errors[:first_name]).to eq(['Field Cannot Be Empty'])
      end

      it 'is invalid last_name' do
        user.last_name = ''
        user.save
        expect(user.errors[:last_name]).to eq(['Field Cannot Be Empty'])
      end
    end

    context 'Email Validation' do
      it 'is invalid email format' do
        user.email = 'harishgmail.com'
        user.save
        expect(user.errors[:email]).to eq(['Check Email Format'])
      end

      it 'should not have empty email' do
        user.email = ''
        user.save
        expect(user.errors[:email]).to eq(['Field Cannot Be Empty','Check Email Format'])
      end
    end

    context 'Password Validation' do
      it 'is invalid password length' do
        user.password = 'qwerty'
        user.save
        expect(user.errors[:password]).to eq(['Length should between 8 to 32'])
      end
    end
  end
end
