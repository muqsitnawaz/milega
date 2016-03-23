class CreateShippingDetails < ActiveRecord::Migration
  def change
    create_table :shipping_details do |t|
      t.belongs_to :order, index:true
      t.string :sname
      t.string :sgender
      t.string :semail
      t.string :sphone
      t.string :saddress
      t.string :sstate

      t.timestamps null: false
    end
  end
end
