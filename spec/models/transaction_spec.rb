require 'rails_helper'

RSpec.describe Transaction do

  before(:all) do
    @transaction = Transaction.new
  end
  it 'is valid amount' do
    @transaction.amount = 500.5
    @transaction.save
    expect(@transaction.errors[:amount]).to eq([])
  end
  it 'is an invalid amount negative number' do
    @transaction.amount = -300
    @transaction.save
    expect(@transaction.errors[:amount]).to eq(['negative amount or characters not allowed'])
  end
  it 'is an invalid amount for string' do
    @transaction.amount = 'char_balance'
    @transaction.save
    expect(@transaction.errors[:amount]).to eq([])
  end

  it 'is valid transaction type' do
    @transaction.transaction_type = 'credit'
    @transaction.save
    expect(@transaction.errors[:transaction_type]).to eq([])
  end

  it 'is valid transaction type' do
    @transaction.transaction_type = 'debit'
    @transaction.save
    expect(@transaction.errors[:transaction_type]).to eq([])
  end

  it 'is an invalid transaction type' do
    @transaction.transaction_type = 'Trans'
    @transaction.save
    expect(@transaction.errors[:transaction_type]).to eq(['invalid type'])
  end
end
