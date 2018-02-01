require 'rails_helper'

RSpec.describe Transaction do
  context "validation" do
    it "is a valid transaction" do
      transaction = Transaction.create!(transaction_type:"credit", amount:5000.5, category_id:1, balance:5000.5, user_id:1)
      expect(transaction.valid?).to eq(true)
    end
  end

  context "validation" do
    it "is an invalid transaction" do
      transaction = Transaction.create!(transaction_type:"AAA", amount:5000.5, category_id:1, balance:5000.5, user_id:1)
      expect(transaction.valid?).to eq(true)
    end
  end


  context 'Amount Validation' do
    it 'is valid amount' do
      user = User.new
      transaction.amount = 5000.5
      expect(transaction.valid?).to eq(true)
    end

    context 'Balance Validation' do
      it 'is valid balance' do
        user = User.new
        transaction.balance = 5000.5
        expect(transaction.valid?).to eq(true)
      end
end
