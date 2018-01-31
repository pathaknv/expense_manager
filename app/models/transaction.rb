class Transaction < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :transaction_type, presence: true, inclusion: { in: %w(credit debit), message: "invalid type" }
  validates :amount, format: { with: /\A[1-9]\d*(\.\d+)?\z/, message: "characters not allowed" }
  validates :balance, format: { with: /\A[1-9]\d*(\.\d+)?\z/, message: "characters not allowed" }

end