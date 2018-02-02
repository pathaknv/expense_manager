class Transaction < ApplicationRecord
  belongs_to :category, optional:true
  belongs_to :user

  validates :transaction_type, presence: true, inclusion: { in: %w(credit debit), message: "invalid type" }
  validates :amount, presence: { message: "Amount cannot be blank" },format: { with: /\A\d*\.?\d+\z/, message: "negative amount or characters not allowed" }

  before_create do
    user = self.user
    user.credit(amount) if self.transaction_type == 'credit'
    user.debit(amount) if self.transaction_type == 'debit'
    self.balance = user.balance
  end

end
