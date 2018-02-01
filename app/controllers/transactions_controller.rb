class TransactionsController < ApplicationController
  def new
    @categories = Category.select(:id, :name).all
  end

  def create
    @user = User.find(params[:user_id])
    # @transaction_params_hash = transaction_params
    # @transaction_params_hash[:transaction][:balance] = calculate_balance
    @transaction = @user.transactions.create!(transaction_params)
    redirect_to user_transactions_path(@user)
  end

  def show
    @user = User.find(params[:id])
    @transactions = Transaction.where(user_id: params[:id])
  end

  def index
    @user = User.find(params[:user_id])
    @transactions = @user.transactions.all
  end

  def filters

  end


  private

  def transaction_params
    params.require(:transaction).permit(:transaction_type, :amount, :category_id, :user_id, :balance)
  end

  # calcluate_balance methods takes user_id from parameters and finds balance from user model
  # takes amount from new view
  # calculates new balance
  # updates new balance on user

  def calculate_balance
    balance = User.select(:balance).where(id:params[:user_id]).pluck(:balance)[0]
    amount = params.require(:transaction).permit(:amount)[:amount].to_f
    balance = balance - amount
    User.where(:id => params.require(:transaction).permit(:user_id)[:user_id].to_i).update(:balance => balance)
    balance
  end
end
