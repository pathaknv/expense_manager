require 'rails_helper'

RSpec.describe User do
  context 'Validation' do
    it 'is valid user' do
      user = User.create!(first_name: 'Harish', last_name: 'Patankar', email: 'harishpatankar@gmail.com', password: '1234567890')
      expect(user.valid?).to eq(true)
    end

    context 'Name Validation' do
      it 'is valid name' do
        user = User.new
        user.first_name = 'Harish'
        user.last_name = 'Patankar'
        user.save
        expect(user.errors[:first_name]).to eq([])
        expect(user.errors[:last_name]).to eq([])
      end

      it 'is invalid first_name' do
        user = User.new
        user.first_name = ''
        user.last_name = 'Patankar'
        user.save
        expect(user.errors[:first_name]).to eq([': Field Cannot Be Empty'])
        expect(user.errors[:last_name]).to eq([])
      end

      it 'is invalid last_name' do
        user = User.new
        user.first_name = 'Harish'
        user.last_name = ''
        user.save
        expect(user.errors[:first_name]).to eq([])
        expect(user.errors[:last_name]).to eq([': Field Cannot Be Empty'])
      end
    end

    context 'Email Validation' do
      it 'is valid email' do
        user = User.new
        user.email = 'harish@gmail.com'
        user.save
        expect(user.errors[:email]).to eq([])
      end

      it 'is invalid email format' do
        user = User.new
        user.email = 'harishgmail.com'
        user.save
        expect(user.errors[:email]).to eq([': Check Email Format'])
      end

      it 'should not have empty email' do
        user = User.new
        user.email = ''
        user.save
        expect(user.errors[:email]).to eq([': Field Cannot Be Empty',': Check Email Format'])
      end
    end

    context 'Password Validation' do
      it 'is valid password length' do
        user = User.new
        user.password = 'qwerty12345'
        user.save
        expect(user.errors[:password]).to eq([])
      end

      it 'is invalid password length' do
        user = User.new
        user.password = 'qwerty'
        user.save
        expect(user.errors[:password]).to eq([': Length should between 8 to 32'])
      end

    end
  end
end
