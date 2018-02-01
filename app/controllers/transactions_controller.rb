class TransactionsController < ApplicationController
  def new
    @categories = Category.select(:id, :name).all
  end

  def create
    @user = User.find(params[:user_id])
    @transaction = @user.transactions.create!(transaction_params)
    redirect_to user_transactions_path(@user)
  end

  def show
    @user = User.find(params[:id])
    @transactions = Transaction.where(user_id: params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => { :user => @user, :transactions => @transactions } }
    end
  end

  def index
    @user = User.find(params[:user_id])
    @transactions = @user.transactions.all
    respond_to do |format|
      format.html
      format.json { render :json => { :user => @user, :transactions => @transactions } }
    end
  end


  private

  def transaction_params
    params.require(:transaction).permit(:transaction_type, :amount, :category_id, :user_id, :balance)
  end
  
  def calculate_balance
    balance = User.select(:balance).where(id:params[:user_id]).pluck(:balance)[0]
    amount = params.require(:transaction).permit(:amount)[:amount].to_f
    balance = balance - amount
    User.where(:id => params.require(:transaction).permit(:user_id)[:user_id].to_i).update(:balance => balance)
    balance
  end
end
