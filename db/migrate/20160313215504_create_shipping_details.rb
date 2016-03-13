class CreateShippingDetails < ActiveRecord::Migration
  def change
    create_table :shipping_details do |t|
      t.belongs_to :order, index:true
      t.string :sname
      t.string :sphone
      t.string :saddress

      t.timestamps null: false
    end
  end
end
