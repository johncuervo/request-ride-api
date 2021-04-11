class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :status
      t.string :license_plate
      t.string :payment_method
      t.string :type

      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
