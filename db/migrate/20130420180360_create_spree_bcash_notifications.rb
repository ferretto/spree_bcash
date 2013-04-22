class CreateSpreeBcashNotifications < ActiveRecord::Migration
  def change
    create_table :spree_bcash_notifications do |t|
      t.integer :order_id
      t.integer :id_transaction
      t.string :status
      
      t.timestamps
      
    end
  end
end
