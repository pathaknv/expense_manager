class TransactionsController < ApplicationController
  include TransactionsHelper
  def new
  end

  def create
    @user = User.find(params[:user_id])
    @transaction_params_hash = transaction_params
    @transaction_params_hash[:balance] = calculate_balance
    @transaction = @user.transactions.create(@transaction_params_hash)
  end

  def show
    @user = User.find(params[:id])
    @transactions = Transaction.where(user_id: params[:id])
  end

  def index
    @user = User.find(params[:user_id])
    @transactions = @user.transactions.all
  end


  private

  def transaction_params
    params.require(:transaction).permit(:transaction_type, :amount, :category, :user_id)
  end

  def calculate_balance
    balance = User.select(:balance).where(params.require(:transaction).permit(:user_id))
    amount = params.require(:transaction).permit(:amount)
    balance = balance - amount
    User.where(:user_id => params.require(:transaction).permit(:user_id)).update(:balance => balance)
    balance
  end
end
