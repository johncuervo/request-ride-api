class CreateRides < ActiveRecord::Migration[6.1]
  def change
    create_table :rides do |t|
      t.integer :driver_id
      t.integer :rider_id
      t.string :status
      t.string :start_address
      t.string :destination_address
      t.datetime :date_initial
      t.datetime :date_final
      t.float  :distance
      t.float  :duration
      t.float  :base_feet
      t.float  :total_amount
      t.string :payment_method

      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
