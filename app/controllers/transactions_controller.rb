class TransactionsController < ApplicationController
  def new
  end

  def create
    @user = User.find(params[:user_id])
    @transaction = @user.transactions.create(transaction_params)
  end

  def index
    @user = User.find(params[:user_id])
    @transactions = @user.transactions.all
  end

  private
  def transaction_params
    get_current_balance params[:user_id]
    params.require(:transaction).permit(:transaction_type, :amount, :category, :user_id)
  end

end
