module TransactionsHelper
  def get_current_balance(user_id)
    balance = (Transaction.select(:balance).where user_id: user_id).last
  end
end
