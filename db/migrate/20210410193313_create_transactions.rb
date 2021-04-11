class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :driver_id
      t.integer :rider_id
      t.integer :ride_id
      t.string :status
      t.float  :total_amount
      t.datetime :date
      t.string :payment_method

      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
