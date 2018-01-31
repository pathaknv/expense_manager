class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :type
      t.float :amount
      t.references :category, foreign_key: true
      t.float :balance
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
