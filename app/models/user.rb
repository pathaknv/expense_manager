# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :first_name, :last_name, :email, :password, presence: { message: 'Field Cannot Be Empty' }
  validates :first_name, :last_name, format: { with: /[a-zA-Z]*/, message: 'Only Alphabets allowed'}
  validates :email, format: { with: /[\w]*\@[\w]*\.[\w]/, message: 'Check Email Format' }
  validates :password, length: { in: 8..32, message: 'Length should between 8 to 32' }
  has_many :transactions

  before_create do
    balance = 0.0
  end
end
