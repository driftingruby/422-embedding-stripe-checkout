class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :session_id
      t.string :stripe_checkout_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
