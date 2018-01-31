require 'rails_helper'

RSpec.describe Transaction do
  context "validation" do
    it "is a valid transaction" do
      transaction = Transaction.create!(transaction_type:"credit", amount:5000.5, category_id:1, balance:5000.5, user_id:1)
      expect(transaction.valid?).to eq(true)
      expect(user.errors.full_message).to eq("any message")
    end
  end
end
